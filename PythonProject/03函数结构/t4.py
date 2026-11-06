# 使用python的for循环完成9x9乘法计算
#大循环范围1-9
for i in range(1,10):
    #小循环范围1-i
    for j in range(1,i+1):
        print(f"{i}*{j}={i*j}",end="\t")
    print()
