#for循环实现学生嵌套列表的信息遍历：

#要求将如下列表中的学员的每个信息单独打印出来，打印出所有学员的总身高

#data是一个嵌套列表，每个子列表包含一个学员的学号、姓名、身高
data=[ [1,'Kate',167], 
    [2,'Mike',178], 
    [3,'Linda',181] ]
# print(data[0][1])

total_height=0

for item in data:
    #for循环迭代时 ，item迭代变量作为一个子列表 等价 data[0] data[1] data[2]....
    print(f"Student ID：{item[0]}，Name：{item[1]}，Height：{item[2]}cm")
    total_height+=item[2]
print(f"所有学员的总身高为：{total_height}cm")