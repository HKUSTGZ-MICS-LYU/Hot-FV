import argparse
import os
from multiprocessing import Pool, Manager, current_process
import random
import subprocess
from functools import partial
import time 
import signal
import select
import errno
import fcntl
import sys
from cal_distance import *
from typing import Dict, Tuple, Optional
import  traceback
import tempfile
import selectors
import threading
import psutil
from threading import Thread, Event

max_memory = 0
stop_event = Event()
memory_monitor = None

def get_total_memory_usage():
    current_process = psutil.Process(os.getpid())
    total_memory = current_process.memory_info().rss

    children = current_process.children(recursive=True)
    for child in children:
        try:
            total_memory = child.memory_info().rss - child.memory_info().shared
        except psutil.NoSuchProcess:
            pass

    return total_memory / (1024 * 1024)  

def monitor_memory_usage(interval=0.1):
    global max_memory
    while not stop_event.is_set():
        current_memory = get_total_memory_usage()
        max_memory = max(max_memory, current_memory)
        time.sleep(interval)

def start_memory_monitor():
    global memory_monitor, stop_event
    stop_event.clear()
    memory_monitor = Thread(target=monitor_memory_usage)
    memory_monitor.daemon = True
    memory_monitor.start()

def stop_memory_monitor():
    global memory_monitor, stop_event, max_memory
    if memory_monitor and memory_monitor.is_alive():
        stop_event.set()
        memory_monitor.join(timeout=1)
    current_max = max_memory
    max_memory = 0 
    return current_max


def init_globals(verified):
    global property_result
    property_result = verified

def timeout_handler(signum, frame):
    raise TimeoutError("Operation might be timed out but will check for 'SAT' before deciding.")

def make_non_blocking(file_obj):
    fd = file_obj.fileno()  
    flags = fcntl.fcntl(fd, fcntl.F_GETFL)  
    fcntl.fcntl(fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)  


def non_blocking_readline(file_obj):
    try:
        return file_obj.readline()
    except IOError as e:
        if e.errno == errno.EAGAIN:
            return None 
        else:
            raise

def run_bmc_old_version(prop_idx, timeout, resume=False,imd_points = None):
    global process_dict
    running_path = os.path.join(cmd_args.collecting_path, str(prop_idx))
    if not os.path.exists(running_path):
        os.makedirs(running_path)


    
    current_directory = os.getcwd()
    output = ""
    errors = ""
    try:
        
        if imd_points is None or prop_idx not in imd_points.keys():
            command_to_run = [
                "/hpc/home/connect.zzheng989/researchlib/ponocca/build/pono", "--bound", "500",
                "--dynamic_coi_up_cex", "--promote-inputvars", "--logging-smt-solver",
                "-e", "bmc", "-p", str(prop_idx), cmd_args.data_file
            ]
        
        else:
            assert resume == True, 'The resume should be True'
            imd_point = imd_points[prop_idx]
            abs_collecting_path = os.path.abspath(cmd_args.collecting_path)
            imd_point_path = os.path.join(abs_collecting_path, str(imd_point))
            imd_state = os.path.join(imd_point_path,"last_state_value.txt")
            print(imd_state)
            assert(os.path.exists(imd_state))
            command_to_run = [
                "/hpc/home/connect.zzheng989/researchlib/ponocca/build/pono", "--bound", "500",
                "--dynamic_coi_up_cex", "--promote-inputvars", "--logging-smt-solver","--set_imd_init",imd_state,
                "-e", "bmc", "-p", str(prop_idx), cmd_args.data_file
            ]
        
        os.chdir(running_path)
        if not resume:
            process = subprocess.Popen(command_to_run, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=1, universal_newlines=True, preexec_fn=os.setsid)
            process_dict[prop_idx] = 'running'
        else:
            pid = process_dict[f"{prop_idx}_pid"]
            os.kill(pid, signal.SIGCONT)  # Resume paused process
            process = subprocess.Popen(command_to_run, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=1, universal_newlines=True, preexec_fn=os.setsid)
        
        make_non_blocking(process.stdout)
        start_time = time.time()
        while True:
            current_time = time.time()
            if current_time - start_time > timeout and ("SAT" not in output):
                os.kill(process.pid, signal.SIGSTOP)
                process_dict[f"{prop_idx}_pid"] = process.pid
                process_dict[prop_idx] = 'paused'
                print(f"Timeout, process for property {prop_idx} paused.")
                break

            line = non_blocking_readline(process.stdout)
            if line:
                output += line

            if process.poll() is not None:
                output += process.stdout.read()
                errors += process.stderr.read()
                process_dict[prop_idx] = 'completed'
                print(f"Process for property {prop_idx} completed.")
                break
            time.sleep(0.1)

    except Exception as e:
        errors += str(e)
        print(f"An error occurred: {e}")
    finally:
        os.chdir(current_directory)
        return output, errors

def check_str_in_file(filename,string):
    for _ in range(70):
        if os.path.exists(filename):
            with open(filename, 'r') as file:
                lines = file.readlines()
                for line in lines:
                    line = line.strip().lower()
                    if line ==  string:
                        return True
                    else:
                        return False
        time.sleep(0.1)

def run_bmc(prop_idx: int, timeout: int, pono_path: str, resume: bool = False, imd_points: Optional[Dict[int, int]] = None) -> Tuple[str, str, str, str]:
    running_path = os.path.join(cmd_args.collecting_path, str(prop_idx))
    if not os.path.exists(running_path):
        os.makedirs(running_path)

    current_directory = os.getcwd()
    output_bmc, errors_bmc, output_pdr, errors_pdr, errors_other = "", "", "", "", ""
    
    try:
        # if resume:
        #     print(prop_idx)
        #     print(imd_points)

        if imd_points is None or prop_idx not in imd_points:
            imd_state = None
        else:
            imd_point = imd_points[prop_idx]
            abs_collecting_path = os.path.abspath(cmd_args.collecting_path)
            imd_point_path = os.path.join(abs_collecting_path, str(imd_point))
            imd_state = os.path.join(imd_point_path, "last_state_value.txt")
            assert os.path.exists(imd_state)

        os.chdir(running_path)

        command_to_run_bmc, command_to_run_pdr = build_command(prop_idx, imd_state, pono_path)

        def run_process(command):
            process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, preexec_fn=os.setsid)
            return process

        process_bmc = run_process(command_to_run_bmc)
        process_pdr = run_process(command_to_run_pdr)

        def kill_processes():
            for process in [process_bmc, process_pdr]:
                if process.poll() is None:
                    try:
                        process.kill()
                    except:
                        pass

        timer = threading.Timer(timeout, kill_processes)
        timer.start()

        try:
            while True:
                if process_bmc.poll() is not None:
                    time.sleep(0.1)
                    print("The bmc process of {:d} is complete".format(prop_idx))
                    break

                if process_pdr.poll() is not None:
                    time.sleep(0.1)
                    
                    # assert os.path.exists('result.txt')
                    if check_str_in_file('result.txt','unsat'):
                        print("The pdr process of {:d} is complete".format(prop_idx))
                        kill_processes()
                        break

                if os.path.exists('bmc.txt') and check_str_in_file('bmc.txt', 'SAT'):
                    timer.cancel()
                    # break

                time.sleep(0.1)

        finally:
            timer.cancel()
            kill_processes()
            
            # Capture output and errors
            output_bmc, errors_bmc = process_bmc.communicate()
            output_pdr, errors_pdr = process_pdr.communicate()

    except Exception as e:
        errors_other += str(e)
        kill_processes()
        print(f"An error occurred: {errors_other}")
        print("Detailed traceback:")
        traceback.print_exc()

    finally:
        os.chdir(current_directory)
        return output_bmc, errors_bmc, output_pdr, errors_pdr


def build_command(prop_idx, imd_state=None, pono_path=None):
    """
    构建运行 bmc 和 pdr 的命令行参数
    """
    if imd_state is None:
        command_to_run_bmc = [
            pono_path, "--bound", "50000",
            "--promote-inputvars",
            "-e", "bmc", "-p", str(prop_idx), cmd_args.data_file
        ]
        command_to_run_pdr = [
            pono_path, "--bound", "50000",
            "--promote-inputvars",
            "-e", "ic3bits", "-p", str(prop_idx), cmd_args.data_file
        ]

    else:
        command_to_run_bmc = [
        pono_path, "--bound", "50000",
        "--promote-inputvars",
        "-e", "bmc", "-p", str(prop_idx), "--set_imd_init", imd_state,cmd_args.data_file
    ]
        command_to_run_pdr = [
            pono_path, "--bound", "50000",
            "--promote-inputvars",
            "-e", "ic3bits", "-p", str(prop_idx), cmd_args.data_file
        ]

    return command_to_run_bmc, command_to_run_pdr




def run_formal(prop_idx, timeout, pono_path, is_first, imd_points=None):
    global process_dict
    
    if is_first:
        stdout_bmc, stderr_bmc, stdout_pdr, stderr_pdr = run_bmc(prop_idx, timeout, pono_path)
    else:
        stdout_bmc, stderr_bmc, stdout_pdr, stderr_pdr = run_bmc(prop_idx, timeout, pono_path, resume=True, imd_points=imd_points)
    
    global property_scores
    global property_result
    
    running_path = os.path.join(cmd_args.collecting_path, str(prop_idx))
    
    result_file = os.path.join(running_path,"result.txt") 
    if  check_str_in_file(result_file,"sat"):      
        print("The error of bmc is :\n"+ stderr_bmc +'\n')
        print("The result of bmc is :\n" + stdout_bmc + "\n")
        print("The error of pdr is :\n"+ stderr_pdr +'\n')
        print("The result of pdr is :\n" + stdout_pdr + "\n")
        property_result[prop_idx] = 'sat'
        property_scores[prop_idx] = 0 
        
    
    elif os.path.exists(result_file) and check_str_in_file(result_file,"unsat"):             
        property_result[prop_idx] = 'unsat'
        property_scores[prop_idx] = 0        
    
    else:
        print("The error of bmc is :\n"+ stderr_bmc +'\n')
        print("The result of bmc is :\n" + stdout_bmc + "\n")
        print("The error of pdr is :\n"+ stderr_pdr +'\n')
        print("The result of pdr is :\n" + stdout_pdr + "\n")       
        bmc_bounds, sat_flag = bmc_info_extract(running_path)
        pdr_bounds = pdr_info_extract(running_path)
        if sat_flag:
            property_result[prop_idx] = 'sat'
            property_scores[prop_idx] = 0
        else:
            property_scores[prop_idx] = calculate_metrics(bmc_bounds, pdr_bounds, prop_idx, timeout)
        # property_scores[prop_idx] = calculate_metrics(bmc_bounds, pdr_bounds, prop_idx, timeout)
    # print(property_result)

def bmc_info_extract(running_path):
    sat_flag = False
    temp_file = os.path.join(running_path,"bmc.txt")
    # with open(temp_file, 'w') as file:
    #     file.write(stdout_bmc)
    # if temp_file is None, wait for the file to be created, timeout is 2s
    for _ in range(20):
        if os.path.exists(temp_file):
            break
        time.sleep(0.1)
                
    with open(temp_file, 'r') as file:
        data = file.readlines()
    bounds = []
    for line in data:
        if 'SAT' in line:
            sat_flag = True
        parts = line.strip().split()
        if len(parts) == 3:
            bound_number, current_time, total_time = map(float, parts)
            bounds.append((bound_number, current_time, total_time))
    return bounds, sat_flag

def pdr_info_extract(running_path):
    temp_file = os.path.join(running_path,"count_clause.txt")
    # with open(temp_file, 'w') as file:
    #     file.write(stdout_bmc)    
    bounds = []    
    if os.path.exists(temp_file):
        with open(temp_file, 'r') as file:
            data = file.readlines()
        
        for line in data:

            key, value = line.split(": ")
            result = [int(key), int(value)]
            bounds.append(result)
    else:
        ## Otherwise, the pdr cannot go to the push frame step, it is hard to be solved 
        bounds.append([1,100])
    return bounds

def calculate_metrics(bmc_bounds,pdr_bounds, prop_idx,timeout):
    score_bmc = bmc_calculation(bmc_bounds, prop_idx,timeout)
    score_pdr = pdr_calculation(pdr_bounds, prop_idx)
    scores_overall = score_bmc + score_pdr
    # scores_overall = score_bmc
    print("The score is \n")
    print(scores_overall)
    return scores_overall


def bmc_calculation(bmc_bounds, prop_idx,timeout):
    max_increase_rate = -1
    previous_time = None
    print("The bmc calculation of {:d} is:".format(prop_idx))

    total_time = bmc_bounds[-1][2]
    running_bnd = bmc_bounds[-1][0]
    increase_rates = []
    # count = 0
    for bound in bmc_bounds[1:]:
        current_time = bound[1]
        if previous_time is not None:
            if previous_time == 0:
                increase_rate = 0
            else:
                increase_rate = ((current_time - previous_time) / previous_time) * 100
            increase_rates.append(increase_rate)
            # max_increase_rate = max(max_increase_rate, increase_rate)
        previous_time = current_time
        # count +=1
    average_increase_rate = sum(increase_rates) / len(increase_rates) if increase_rates else 0
    # end_stability = calculate_stability(increase_rates[-5:]) if len(increase_rates) >= 5 else 0
    scores = running_bnd + 0.2*timeout/running_bnd
    print("The score of bmc is")
    print(scores)
    # scores = running_bnd
    return scores

def pdr_calculation(pdr_bounds, prop_idx):
    max_increase_rate = -1
    previous_time = None
    print("The pdr caculation of {:d} is:".format(prop_idx))
    total_frame = 0
    total_clause = 0
    for bound in pdr_bounds:
        total_frame += 1
        total_clause += bound[1]
        # count +=1
    average_frame_per_clause = total_clause / total_frame
    # end_stability = calculate_stability(increase_rates[-5:]) if len(increase_rates) >= 5 else 0
    scores = average_frame_per_clause*0.2
    print("The score of pdr is \n")
    print(scores)
    # scores = running_bnd
    return scores

def property_selection(num_properties,random_sample):
    keys = [key for key, value in property_result.items() if value == 'unknown']
    

    if not keys:
        return []
    
    if num_properties >= len(keys):
        return keys
    
    if(random_sample):
        selected_keys = random.sample(keys, num_properties)
        print("We randomly select the keys: \n")
        print(selected_keys)
        print('\n')
        return selected_keys
    else:
        key_score_pairs = [(key, property_scores.get(key, float('inf'))) for key in keys]

        # 使用sorted函数对元组列表进行排序，排序依据是元组的第二个元素，即分数
        sorted_key_score_pairs = sorted(key_score_pairs, key=lambda x: x[1])

        # 选取排序后的前k个元素的键
        lowest_k_keys = [pair[0] for pair in sorted_key_score_pairs[:num_properties]]
        print("We heuristically select the keys: \n" )
        print(lowest_k_keys)
        print("\n")
        return lowest_k_keys        


def get_points(idx_path):
    properties_map = {}
    properties_result = {}
    
    
    with open(idx_path, 'r') as file:
        for line in file:
            parts = line.strip().split()
            if len(parts) == 2:
                key = int(parts[0])  # 将行号转换为整数
                value = int(parts[1])  # 将索引号转换为整数
                properties_map[key] = value
                properties_result[key] = 'unknown'
    
    return properties_map, properties_result

def signal_handler(sig, frame):
    print("Signal received, shutting down...")
    sys.exit(0)


def get_cloest_imd_point(point_list):
    
    imd_points = {}
    
    print("The property map is: \n")
    print(property_map)
    for point in point_list:
        dist_without_assign = {}
        prop_id = property_map[point]
        print(point)
        dist = cal_distance_to_target(prop_id, cfg_data,cmd_args.reset_file)
        del dist[prop_id]
        for assign, score in dist.items():
            if cfg_data['assign_to_block'][assign] not in cfg_data['assign_block']:
                dist_without_assign[assign] = score

        # filtered_dist = {k: v for k, v in dist.items() if v != float('inf')}
        # sorted_dist = [k for k, v in sorted(dist_without_assign.items(), key=lambda item: item[1])]
        sorted_dist = [k for v in sorted(set(dist_without_assign.values())) for k in sorted([k for k, v2 in dist_without_assign.items() if v2 == v], key=lambda _: random.random())]
        for dist_point in sorted_dist:
            if dist_point in reverse_property_map:
                dist_point_idx = reverse_property_map[dist_point]
                if(property_result[dist_point_idx]=='sat'):
                    imd_points[point] = dist_point_idx
                    with open(score_collection, 'a+') as file:
                        file.write("We select the imtermidiate state of the point {:d} for point {:d} \n".format(dist_point_idx,point))
                    break
        if(point not in imd_points.keys()):
            with open(score_collection, 'a+') as file:
                file.write("No intermidiate state can be selected for point {:d} \n".format(point))
    
    return imd_points

if __name__ == "__main__":
    cmd_opt = argparse.ArgumentParser(description='Argparser')
    cmd_opt.add_argument('-pono_path', default=None, help='The path of the pono')
    cmd_opt.add_argument('-data_file', default=None, help='The target Btor file')
    cmd_opt.add_argument('-data_file_pdr', default=None, help='The target Btor file for pdr (without array)')
    cmd_opt.add_argument('-collecting_path', default=None, help='The coolecting result path')
    cmd_opt.add_argument('-verify_idx', default=None, help='The index File of each property')
    cmd_opt.add_argument('-cfg_file', default=None, help='The control flow graph file for the given design')
    cmd_opt.add_argument('-reset_file', default=None, help='Some points related to the reset that are not need to verified.(For or1200)')
    cmd_opt.add_argument('-num_cores', default=1, type=int, help='Number of cores that we can use')
    cmd_opt.add_argument('-use_random_ordering', action='store_true', default=False,
                        help='Whether we use random selection process')
    cmd_opt.add_argument('-without_imd', action='store_true', default=False,
                        help='Whether we use imtermidiate state')
    cmd_args, _ = cmd_opt.parse_known_args()
    
    signal.signal(signal.SIGINT, signal_handler)
    manager = Manager()
      
    property_result = manager.dict()  
    
    process_dict = manager.dict()
    property_scores = manager.dict()
    
    property_map, init_result = get_points(cmd_args.verify_idx)
    
    reverse_property_map = {v: k for k, v in property_map.items()}

    cfg_data = read_cfg_pkl(cmd_args.cfg_file)
    # cfg_data = extract_cfg(cfg_data)
    cfg_data['assign_to_count'] = invert_dict(cfg_data['count_to_assign'])
    cfg_data['block_to_assign'] = invert_dict(cfg_data['assign_to_block'])
    
    for key in property_map:
        property_result[key] = init_result[key]    
    
    if os.path.exists(cmd_args.collecting_path)==False:
        os.mkdir(cmd_args.collecting_path)


    start_time = time.time()
    sample_idx = property_selection(len(property_map),cmd_args.use_random_ordering) 
    # sample_idx = [107]
    base_timeout = 30
    start_memory_monitor()

    try:
        with Pool(processes=cmd_args.num_cores, initializer=init_globals, initargs=(property_result,)) as pool:
            run_formal_partial = partial(run_formal, timeout=base_timeout, pono_path=cmd_args.pono_path, is_first=True, imd_points=None)
            # pool.map(run_formal_partial, sample_idx)
            pool.map(run_formal_partial, sample_idx)
            time.sleep(1)  # 给一些时间来暂停进程  

            result_file = os.path.join(cmd_args.collecting_path, "result.txt")
            score_collection = os.path.join(cmd_args.collecting_path, "score.txt")
            unreachable_collection = os.path.join(cmd_args.collecting_path, "unreachable.txt")
            memory_collection = os.path.join(cmd_args.collecting_path, "memory.txt")
            unknown_collection = os.path.join(cmd_args.collecting_path, "unknown.txt")
            
            verified_count = sum(value != 'unknown' for value in property_result.values())
            verified_reachable = sum(value == 'sat' for value in property_result.values())
            end_time = time.time()
                
            with open(result_file, 'a+') as file:
                file.write(f"{end_time - start_time} {verified_count/len(property_result)} {verified_reachable/len(property_result)}\n")    
            with open(memory_collection, 'a+') as file:
                current_max = stop_memory_monitor()
                file.write(f"Memory Usage: {current_max :.2f} MB\n")        
            #TODO:getting the initial score, tries to give the ordering of each property
            
            # 基础超时时间
            # 基础超时时间
            base_timeout = 30
            # 超时时间增加的步长
            timeout_increment = 30            
            # 超时时间增加的步长
            timeout_increment = 30
            # 计数器
            count = 1

            start_memory_monitor()
            while ('unknown' in property_result.values()):
                # print(property_result)
                sample_idx = property_selection(cmd_args.num_cores*2, cmd_args.use_random_ordering)
                # sample_idx = [107]
                if cmd_args.without_imd:
                    imd_points =None
                else:
                    imd_points = get_cloest_imd_point(sample_idx)
                
                with open(score_collection, 'a+') as file:
                    file.write(str(count) + ":\n")
                    for key, val in property_scores.items():
                        file.write(str(key) + " "+ str(val)+ "\n")  

                    file.write("\n")              
                    file.write("We select: \n")
                    for idx in sample_idx:
                        file.write(str(idx) + " ")
                    file.write("\n")
                
                with open(unknown_collection, 'a+') as file:
                    file.write(str(count) + ":\n")
                    for key, val in property_result.items():
                        if val == 'unknown':
                            file.write(str(key) + " ")
                    file.write("\n")
                
                with open(unreachable_collection, 'a+') as file:
                    file.write(str(count) + ":\n")
                    for key, val in property_result.items():
                        if val == 'unsat':
                            file.write(str(key) + " ")
                    file.write("\n")
                with open(memory_collection, 'a+') as file:
                    current_max = stop_memory_monitor()
                    file.write(f"Memory Usage: {current_max :.2f} MB\n")
                start_memory_monitor()
                
                current_timeout = base_timeout + count * timeout_increment 
                run_formal_partial = partial(run_formal, timeout=current_timeout, is_first =False, imd_points= imd_points, pono_path=cmd_args.pono_path)
                pool.map(run_formal_partial, sample_idx)
                
                verified_count = sum(value != 'unknown' for value in property_result.values())
                verified_reachable = sum(value == 'sat' for value in property_result.values())
                end_time = time.time()
                
                with open(result_file, 'a+') as file:
                    file.write(f"{end_time - start_time} {verified_count/len(property_result)} {verified_reachable/len(property_result)}\n")    
                

                count += 1
    
    except KeyboardInterrupt:
        print("Caught KeyboardInterrupt, terminating workers.")
        pool.terminate()  # 这将立即终止所有工作进程
        pool.join()       # 等待工作进程实际退出       