import operator as op

#定义getData()函数， 从键盘接收data1，oper，data2，保存在data中
def getDate():
    data = input("请输入算式用空格隔开，如 3 + 5\n").split()
    data1=data[0]
    oper=data[1]
    data2=data[2]
    return data1,oper,data2

#如果运算符号是否在['+','-','*','/']，调用computer(*data)函数,传递data1，oper，data2，并获取计算结果result进行打印;
#在函数定义里，*加在参数名前面表示 接收任意多个位置参数 ，打包成一个元组 
#对data1转换成整型
#对data2转换成整型
#根据oper的运算符，分别进行加减乘除计算
def computer(*data):
    data1,oper,data2 = data
    data1,data2=int(data1),int(data2)
    oper_list={'+':op.add,'-':op.sub,'*':op.mul,'/':op.truediv}
    if oper in oper_list:
        if oper == '/':
            if data2 == 0:
                print("除数不能为0")
                return None
        #oper_list[oper] 用符号变量oper当 key，取出对应的函数（如`operator.add`）
        return oper_list[oper](data1,data2)
#如果运算符号不在['+','-','*','/']，则提示运算符错误，结束执行.
    else:
        print("运算符错误")
        return None

# 主程序
data1,oper,data2 = getDate()
result = computer(data1,oper,data2)
if result != None:
    print(result)
else:
    print("计算错误")