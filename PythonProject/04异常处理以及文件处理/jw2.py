# 文件名 文件模式 编码
#w+ 每次写入，都会覆盖之前的内容
#a+ 每次写入，都会在文件末尾追加内容，不会覆盖之前的内容
#a+ w+无法读取文件内容，是因为w+模式下，文件指针在文件开头，无法读取到内容
with open('demo1.txt','a+',encoding='utf-8') as fp:
#seek() 方法可以将文件指针移动到指定的位置
    fp.seek(1) #将文件指针移动到文件第二个位置 0开头

    print(fp.read(2))

fp.close()


#字符串操作find()
fileName='demo.tar.gz'
print(fileName.find('.')) #返回.的索引位置 (左右)
print(fileName.rfind('.')) #返回.的索引位置 (右左)