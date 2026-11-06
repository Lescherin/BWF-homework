def calc(data1,oper,data2):
#将data1转变成整数类型
    data1=int(data1)
#将data2转变成整数类型
    data2=int(data2)
#判断如果oper取值在['+','-','*','/']范围：
    if oper in ['+','-','*','/']:
    #判断如果oper等于'+':
        if oper=='+':
            #打印data1+data2
            print(data1+data2)
        #如果oper等于'-':
        elif oper=='-':
            #打印data1-data2
            print(data1-data2)
        #如果oper等于'*':
        elif oper=='*':
            #打印data1*data2
            print(data1*data2)
        elif oper=='/':
            #打印data1/data2
            print(data1/data2)      
        #否则:
        else:
            #打印运算符错误
            print('oper键入运算符错误')

#按照100,'+',200的输入格式从接盘接收两个运算数，一个运算符，保存在data1，data2，oper三个变量中
data1,oper,data2=input().split(',')
#调用calc函数，将data1，oper，data2作为参数传递给calc函数
calc(data1,oper,data2)