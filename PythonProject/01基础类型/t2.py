# -*- coding: utf-8 -*-
import sys
try:
    sys.stdout.reconfigure(encoding='utf-8')
    sys.stderr.reconfigure(encoding='utf-8')
except Exception:
    pass

data1={}                              # 定义空字典

data1={'ID':101}                    # 定义1个元素字典

data1={'ID':101,'name':'Kate'}  # 定义2个元素字典

type(data1)                           # 查看类型

len(data1)                             # 查看长度

data1['ID']                            # 查看元素值

'name' in data1                        # 判断key是否存在

'name' in data1.keys()

'Kate' in data1.values()           # 判断Kate在字典的value中是否存在

data1['name']='Linda'            # 指定键给元素赋值

data1.pop('name')                 # 指定键删除元素

del data1['ID']                      # 指定键删除元素

del data1                                 # 删除字典

 

data={

'1':{'Name':'Kate','Home':'shandong','Birth':'2020-01-01'},

'2':{'Name':'Mike','Home':'shanxi','Birth':'2020-10-11'},

'3':{'Name':'Linda','Home':'sichuan','Birth':'2021-02-21'}

}

data['1']                              # 根据key获取信息

data['1']['Name']                  # 根据key获取信息

data['2']['Home']                  # 根据key获取信息

#data[1]['Birth']                     # 分析为啥会报错，如何纠正错误
# data是字典    不可用数字作为key，只能用字符串作为key
data['1']['Birth']
   
 

stuid='3'

data[stuid]

data[stuid]['Name']

 

#stuid=2
# 字典的 key 是 字符串 ，不是整数
stuid='2'
data[stuid]                          # 分析为啥会报错，如何纠正

data[stuid]['Name']

