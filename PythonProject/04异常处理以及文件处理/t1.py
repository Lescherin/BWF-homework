# 基于附件代码进行异常处理，确保所有用例都能执行完毕，统计最终执行的用例总数，正常执行用例数，异常执行用例数
def computer(data1,oper,data2):   # 定义一个有参函数,形式参数，参数作用：把函数外部的数据带入到函数内部
    try:
        if oper=='+':
            return data1+data2        # return 返回函数运行的结果
        elif oper=='-':
            return data1-data2
        elif oper=='*':
            return data1*data2
        elif oper=='/':
            return data1/data2
    except ZeroDivisionError as e:
        print('data2除数不能为0',e)
        return None

caseList=[(100,'+',20),(100,'/',0),(100,'-',10),(100,'+'),(30,'+','20'),(25,'*',4)]
for case in caseList:
    data1,oper,data2=case
    result=computer(data1,oper,data2)
    print(result)