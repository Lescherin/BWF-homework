# 99乘法表while实现
i=1
while i<=9:
    j=1
    while j<=i:
        print(f"{i}*{j}={i*j}",end="\t")
        j+=1
    i+=1
    print() # 空打印默认换行
