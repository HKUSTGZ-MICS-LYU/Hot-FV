import pickle, os, sys
import random
prefix = 'lib'
module_path = os.path.join(os.getcwd(), prefix)
if module_path not in sys.path:
    sys.path.append(module_path)

def read_cfg_pkl(file_path):
    try:
        with open(file_path, 'rb') as file:
            data = pickle.load(file)
            return data
    except FileNotFoundError:
        print(f"File {file_path} not found.")
    except pickle.UnpicklingError:
        print(f"Error unpickling file {file_path}.")
    except Exception as e:
        print(f"An error occurred: {e}")
    
def invert_dict(d):
    try:
        return {v: k for k, v in d.items()}
    except TypeError as e:
        print(f"Error: {e}. Ensure all values are hashable and unique.")
        return None

def extract_reset_target(path):
    reset_targets = []

# 打开文件并读取内容
    with open(path, 'r') as file:
        # 逐行读取文件
        for line in file:
            # 去除每行末尾的换行符，并将其转换为整数
            target = int(line.strip())
            # 将数字添加到列表中
            reset_targets.append(target)
    
    return reset_targets

# recursive find idom of next block
def find_idom(cfg_data, current_block):
    if cfg_data[current_block]['assign_type'].find('BRANCH') != -1:
        return current_block
    if len(cfg_data[current_block]['orig_idom']) == 0:
        if current_block in cfg_data['assign_block']:
            return current_block
        return None
    else:
        for next_block in cfg_data[current_block]['orig_idom']:
            return find_idom(cfg_data, next_block)


def cal_distance_to_target(target, cfg_data,remove_point_path = None):
    dist = {}
    reset_targets = []
    if remove_point_path is not None:
        reset_targets = extract_reset_target(remove_point_path)
    dist[target] = 0.0
    queue = [target]
    while queue:
        current_target = queue.pop(0)
        current_block = cfg_data['assign_to_block'][current_target]
        for next_block in cfg_data[current_block]['idom']:
            # recursive find idom of next block
            if next_block not in cfg_data['block_to_assign'].keys():
                continue
            if next_block in cfg_data[current_block]['orig_idom']:
                continue
            if cfg_data[next_block]['assign_type'].find('BRANCH') == -1:
                _next_block = find_idom(cfg_data, next_block)
                if _next_block is None:
                    continue
                else:
                    next_block = _next_block
            next_target = cfg_data['block_to_assign'][next_block]
            if next_target in reset_targets:
                continue
            
            if next_target not in dist.keys() and next_block not in cfg_data['assign_block']:
                if dist[current_target] < 1.5:
                    dist[next_target] = dist[current_target] + 1.0
                    queue.append(next_target)
            elif next_target not in dist.keys():
                queue.append(next_target)
                dist[next_target] = dist[current_target] + 0.01
    return dist

def extract_cfg(cfg_data):
    cfg = {}
    cfg['assign_to_block'] = {}
    cfg['count_to_assign'] = cfg_data['coverage_dict']
    for block in cfg_data['block_list']:
        cfg[block.id] = {}
        cfg[block.id]['predecessors'] = []
        cfg[block.id]['successors'] = []
        cfg[block.id]['idom'] = []
        cfg[block.id]['orig_idom'] = []
        for successor in block.successors:
            cfg[block.id]['successors'].append(successor.id)
        for idom in block.idom_list:
            cfg[block.id]['idom'].append(idom)
        cfg[block.id]['orig_idom'] = block.orig_idom
        for predecessor in block.predecessors:
            if predecessor is not None:
                cfg[block.id]['predecessors'].append(predecessor.id)
        if block.assign_list and len(block.assign_list) > 0:
            cfg['assign_to_block'][block.assign_list[0].id] = block.id
    
    return cfg
    
# file_path = "benchmark/RocketTile_Small/cfg.pkl"
# cfg_data = read_cfg_pkl(file_path)
# cfg_data['assign_to_count'] = invert_dict(cfg_data['count_to_assign'])
# cfg_data['block_to_assign'] = invert_dict(cfg_data['assign_to_block'])

# dist = cal_distance_to_target(19576, cfg_data)
# print(len(dist))

# dist_noassign ={}
# for assign, score in dist.items():
#     if cfg_data['assign_to_block'][assign] not in cfg_data['assign_block']:
#         dist_noassign[assign] = score
# print(dist_noassign)
# sorted_points = [k for k, v in sorted(dist_noassign.items(), key=lambda item: item[1])]
# print(sorted_points)
