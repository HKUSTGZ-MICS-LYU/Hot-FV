import os
import pandas as pd
import re

def natural_sort_key(s):
    return [int(c) if c.isdigit() else c.lower() for c in re.split(r'(\d+)', s)]

def process_files(root_dir):
    results = []
    folders = []

    # 首先收集所有文件夹
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'bmc.txt' in filenames:
            folders.append(dirpath)

    # 对文件夹进行自然排序
    folders.sort(key=natural_sort_key)

    # 现在处理排序后的文件夹
    for folder_index, dirpath in enumerate(folders):
        filenames = os.listdir(dirpath)
        if 'bmc.txt' in filenames:
            bmc_path = os.path.join(dirpath, 'bmc.txt')
            result = {'Folder': folder_index, 'Status': 'Unknown', 'Bound': None, 'Time': None}
            # folder_counter += 1

            # 读取bmc.txt
            with open(bmc_path, 'r') as file:
                lines = file.readlines()
                if lines:
                    last_line = lines[-1].strip()
                    parts = last_line.split()
                    if len(parts) == 4 and parts[3] == 'SAT':
                        result['Status'] = 'SAT'
                        result['Bound'] = int(parts[0])
                        result['Time'] = float(parts[2])
            
            # 如果不是SAT，检查result.txt
            if result['Status'] == 'Unknown' and 'result.txt' in filenames:
                result_path = os.path.join(dirpath, 'result.txt')
                with open(result_path, 'r') as file:
                    content = file.read().lower()
                    if 'unsat' in content:
                        result['Status'] = 'UNSAT'

            results.append(result)

    return results

# 使用文件夹的路径
root_directory = "./Formal_Verifcation_for_testing_design/b12/result_our_without_imd_2"
results = process_files(root_directory)

# 创建DataFrame并保存为Excel
df = pd.DataFrame(results)
df = df.sort_values('Folder')  # 确保按照Folder列排序
excel_path = "Rocket_Tiny_Rand.xlsx"
df.to_excel(excel_path, index=False)
print(f"Results saved to {excel_path}")