data2=()    #set空集
data2=(100,) # 单元素元组
data2=(100,200,300) # 多元素元组
type(data2)
max(data2) # 查看元组中最大的元素
min(data2) # 查看元组中最小的元素
sum(data2) # 查看元组中所有元素的和
len(data2) # 查看元组中元素的数量
sorted(data2) # 对元组中的元素进行排序
data2[0] # 查看元组中的第一个元素
data2[1] # 查看元组中的第二个元素

if (200 not in data2) :
    print('200不在元组中')
else:
    print('200在元组中')

stuInfo=( # 学生信息元组 二维元组
    ('101','Kate','20'),
    ('102','Mike','21'),
    ('103','Linda','19'),
    ('104','Pose','21')
)
print(stuInfo[1][1]) # 查看元组中的第二行第二个元素
print(stuInfo[-1][0]) # 查看元组中的最后一行第一个元素

i=0

j=1

print(stuInfo[i])    # 查看第i行

print(stuInfo[i+1]) # 查看第i+1行 

print(stuInfo[i][j]) # 查看第i行第j列的元素
