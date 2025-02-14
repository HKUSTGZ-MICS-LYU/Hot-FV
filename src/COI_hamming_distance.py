from itertools import combinations
import argparse
import os
import subprocess
import openpyxl
from multiprocessing import Pool, Manager

def run_with_timeout(prop_idx, btor_path, pono_path):
    command_to_run = [pono_path, "--bound","20","--logging-smt-solver",
                "--coverage_analyze",
                "--only_COI_analyze",
                "-p", str(prop_idx),
                btor_path]
    process = subprocess.Popen(command_to_run, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    try:
        stdout, stderr = process.communicate(timeout=20)
    except subprocess.TimeoutExpired:
        process.kill()
        stdout, stderr = process.communicate()
        raise TimeoutError("{} | running time out in {} s.".format(btor_path, 20))
    return stdout.decode(), stderr.decode()


def get_points(idx_path):
    properties_map = {}
    
    
    with open(idx_path, 'r') as file:
        for line in file:
            parts = line.strip().split()
            if len(parts) == 2:
                key = int(parts[0])  # 将行号转换为整数
                value = int(parts[1])  # 将索引号转换为整数
                properties_map[key] = value
    
    return properties_map


def run_para(running_path, idx, btor_file, pono_path, result, current_directory):
    # global result
    
    if not os.path.exists(running_path):
        os.makedirs(running_path)
    os.chdir(running_path)
    out, sterr = run_with_timeout(idx, btor_file, pono_path)
    assert(os.path.exists(("static-coi.txt")))
    with open("static-coi.txt","r") as f:
        vars = [line.strip() for line in f.readlines()]
    # set_output = set(list_output)
    result[idx] = vars
    print(out)
    os.chdir(current_directory)


def idx_combine(idx_path, btor_file, pono_path):
    properties_map = get_points(idx_path)
    current_directory = os.getcwd()
    manager = Manager()
    result = manager.dict()  # 使用Manager来创建一个跨进程的字典
    paths = []
    idx_all = []
    for idx, prop in properties_map.items():
        running_path = os.path.join(opts.collecting_path, str(idx))
        paths.append(running_path)
        idx_all.append(idx)

    num_processes = 50
    with Pool(processes=num_processes) as pool:
        pool.starmap(run_para, [(path, idx, btor_file,result,current_directory) for path, idx in zip(paths, idx_all)])
    
    
        
    
    workbook2 = openpyxl.Workbook()
    sheet2 = workbook2.active    
    sheet2.append(['Props', "Hamming Distance"])
    all_idx= list(result.keys())
    # for n in range(2, len(properties_map) + 1):
    # for n in range(2, len(properties_map) + 1):
    for combo in combinations(all_idx, 2):
            
            filenames = []
            for file in combo:
                # base = os.path.basename(file)
                # prop = os.path.splitext(base)
                filenames.append(str(file))

            outputs = []
            for file in combo:
                outputs.append(result[file])
            set_outputs = [set(output ) for output in outputs]
            union_result = set.union(*set_outputs)
            intersection_result = set.intersection(*set_outputs)

            # 转换回列表
            union_list_result = list(union_result)
            intersection_list_result = list(intersection_result)
            count_reg = btor_state_cal(btor_file)
            hamming_distance = 1 - (len(union_list_result) - len(intersection_list_result))/count_reg
            print(hamming_distance)
            sheet2.append([', '.join(filenames), hamming_distance])
    
    
    
    workbook2.save('COI_Rocket.xlsx')


def btor_state_cal(btor_file):
    with open(btor_file, "r") as f:
        lines = f.readlines()


    # lines = btor_content.strip().split("\n")
    bitvec_widths = {}
    state_bit_width_count = {}
    count = 0
    for line in lines:
        # print(line)
        parts = line.split()
        # Record bitvec widths
        if parts[1] == "sort" and parts[2] == "bitvec":
            bitvec_widths[parts[0]] = int(parts[3])
        # Count state variables by bit width
        elif parts[1] == "state":
            count += 1
    return count        

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('pono_path', action='store', type=str)
    parser.add_argument('idx_path', action='store', type=str)
    parser.add_argument('collecting_path', action='store', type=str)
    parser.add_argument('btor_file', action='store', type=str)
    opts = parser.parse_args(args=['/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/idx.txt',
                                   "Static_COI",
                                '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/RocketTile_assert.btor'
                                ])
    
    if os.path.exists(opts.collecting_path)==False:
        os.mkdir(opts.collecting_path)
    
    idx_combine(opts.idx_path, opts.btor_file)