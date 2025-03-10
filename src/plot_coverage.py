import matplotlib.pyplot as plt
import os

# 文件列表
files = [
    '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/b12/without_cfg_ordering_n_3/result.txt', 
         '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/b12/without_cfg_without_ordering_n_3/result.txt',
        #  '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/result_from_ziyue/without_cfg.txt'
        #  '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/result_random_3/result.txt',
        #  '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/result_ordering_only_bnd/result.txt',
        #  '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/result_ordering_add_increase_rate/result.txt',
        #  '/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/Rocket/result_ordering_add_increase_rate/result.txt'
         ]  

# 创建一个新的图形和轴对象
fig, ax = plt.subplots()

for file in files:
    # 初始化存储时间和覆盖率的列表
    times = []
    coverages = []

    # 打开并读取文件
    with open(file, 'r') as f:
        for line in f:
            parts = line.split()
            time = float(parts[0])
            coverage = float(parts[2])
            print(parts[1],parts[2])
            times.append(time)
            coverages.append(coverage)
    label = os.path.basename(os.path.dirname(file))
    # label = os.path.basename(file)
    # 绘制每个文件的数据
    ax.plot(times, coverages, label=label)

# 设置图例，方便识别不同的曲线
ax.legend()

# 设置x和y轴的标签
ax.set_xlabel('Time (seconds)')
ax.set_ylabel('Coverage')

# 显示图形
plt.show()

# 保存图像到文件
plt.savefig('/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/b12/coverage_sat_n_3.pdf', format='pdf')  # 指定保存路径和文件格式

# 显示图形
plt.show()