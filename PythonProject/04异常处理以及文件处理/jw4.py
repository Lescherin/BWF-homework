with open('data.txt' ,'w+',encoding='utf-8') as fp:
    fp.seek(0)   
    str='hello world'
    fp.write(str)



def backupFile(fileName):
   try:
        #1.处理文件名
        #data.txt -> data-backup.txt
        flag1=fileName.rfind('.')
        print(flag1)
        #1.1 文件名 + 后缀
        backupFileName=fileName[:flag1]+'-backup'+fileName[flag1:]
        print(backupFileName)

        #2. 处理内容
        oldFile=open(fileName,'r',encoding='utf-8')
        newFile=open(backupFileName,'w+',encoding='utf-8')
        for line in oldFile:
            newFile.write(line)
        oldFile.close()
        newFile.close()
   except FileNotFoundError:
        print('文件不存在')


if __name__ == '__main__':
    backupFile('data.txt')
