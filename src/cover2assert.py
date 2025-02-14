# 导入必要的库
import re

# 读取原始 Verilog 文件
with open("/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/or_1200/or_1200_4.v", "r") as file:
    content = file.read()

# 使用正则表达式替换
modified_content = re.sub(r"cover property \(_coverage\[(\d+)\]==1\);",
                          r"assert property (_coverage[\1]==0);",
                          content)

# 输出转换后的内容到新的文件
with open("/hpc/home/connect.zzheng989/Formal_Verifcation_for_testing_design/or_1200/or_1200_assert.v", "w") as file:
    file.write(modified_content)