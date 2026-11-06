# 阶乘递归
def factorial(mul):

    if mul==1:
        return 1
        #递归 出口
    else:
        result=mul*factorial(mul-1)
    return result
        
# 自测
# if __name__ == '__main__'用于测试函数  含义：如果当前文件是主程序就执行
# 如果文件被直接执行，会执行
# 如果文件被调用，不会执行
#__name__是特殊变量，用于判断当前文件是否是主程序
#__main__是主程序的名称
if __name__ == '__main__':
    print(factorial(3))
    print(factorial(4))

