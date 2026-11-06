data="hello,boys,girls\nyou are\nwelcome" # 定义字符串

type(data)                                               # 返回数据类型

id(data)                                                  # 返回内存地址

print(data)                                              # 打印data信息到屏幕

len(data)                                                # 返回data长度

data[:]                                                    # 返回data

data[::]                                                   # 返回data

data[::1]                         # 返回data

data[::2]                         # 返回data,每隔两个字符取一次

data[::-1]                        # 返回data，逆序输出

data[::-2]                        # 返回data，逆序输出，每隔两个字符取一次

data[1:8:1]

data[1:8:2]

data[2:-2:1]

data[9:2:-1]

data[9:2:-2]

'o' in data                            # 判断字符'o'是否在data字符串

'boys' in data                      # 判断字符'boys'是否在data字符串

'boys' not in data               # 判断字符'boys'是否不在data字符串

 

"100,200".split(',')                           # 根据逗号拆分字符串

input('Please input a data:')             # 从键盘接收数据，输入100,200 敲回车

input('Please input a data:').split(',')  # 从键盘接收数据，输入100,200 敲回车

data=input('Please input a data:')     # 从键盘接收数据，输入100,200 敲回车

data                                                   # 查看data

data1,data2=data.split(',')               # 对data进行拆分，保存在data1和data2中

data1

data2

data1+data2                  # data1和data2都是字符串，做+字符串拼接操作

data1+200                 # 分析为啥会报错

 

data1=int(data1)          # data1字符串转化成整数，保存在data1中

data2=int(data2)           # data2字符串转化成整数，保存在data2中

data1+data2                 # data1和data2求和

 

name='Kate'

age=18

print(f'my name is {name},I am {age} years old today')

print(f'{name}:{age}')