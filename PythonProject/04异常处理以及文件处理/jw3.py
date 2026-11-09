with open('demo.txt','r',encoding='utf-8') as fp:
    #readline() 方法可以读取文件的一行内容
    content=fp.readline()
    print(content)

    #readlines() 方法可以读取文件的所有行内容
    content1=fp.readlines()
    print(content1)

    #用for循环取出某一行内容 readline() 方法变为列表
    count=1
    for line in content1:
        if count == 3:
            print(line)
        count+=1

#文件拷贝 demo.txt -> demo-backup.txt 
#读取demo.txt文件内容 用content列表存储
with open('demo.txt','r',encoding='utf-8') as fp:
    content=fp.readlines()
    print(content)
    #写入demo-backup.txt文件
with open('demo-backup.txt','w+',encoding='utf-8') as fp:
    fp.writelines(content)
