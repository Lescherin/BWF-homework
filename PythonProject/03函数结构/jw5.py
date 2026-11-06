# 导入函数为单位  调用指定函数
# from zhangsan import factorial
# 另一个文件夹的函数
# from lisi.li import li_add

# 导入整个模块 但是调用时需要模块名.函数名
# 快捷键：Enter+Alt 进行自动导包
import zhangsan
import lisi.li as li


print('zhangsan的阶乘是：',zhangsan.factorial(3))
print('lisi的加法是：',li.li_add(1,2))
print('lisi的加法是：',li.li_add(3,4))
