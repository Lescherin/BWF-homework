data1=[]

data1=[100]

data1=[100,20,30]

type(data1)

max(data1)

min(data1)

sum(data1)

len(data1)

sorted(data1)      # 对列表元素进行排序，从小到大， reverse=True 可以从大到小，不改变列列表存储

data1[0]

20 in data1

data1.append(50)   # 追加一个列表元素，

data1.extend([6,7])  # 批量追加列表元素

data1.insert(1,9)     # 插入列表元素

data1[1]=99

data1.pop(0)         # 删除列表元素

data1.remove(50)  # 移除列表元素

del data1[1]

del data1

 

stuInfo=[                       # 定义嵌套列表

[101,'Kate',20],

[102,'Mike',22],

[103,'Rose',19],

[104,'Linda',21]

]

stuInfo[1][1]                  # 对嵌套列表元素进行访问

stuInfo[-1][0]

#新增变量信息
i=0

j=1

print(stuInfo[i])

#变量重新赋值
i=1

print(stuInfo[i][j]) #2行2个元素
