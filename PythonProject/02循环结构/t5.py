#1. 使用while循环计算1-100的和
sum = 0
i = 1
while i <= 100:
    sum += i
    i += 1
print(sum)



#2. 使用while循环计算100以内偶数的和是多少
sum = 0
i = 2
while i <= 100:
    sum += i
    i += 2
print(sum)

#3. 使用while循环将100以内7的倍数或者数字中包含7的数字都打印出来
i = 1
while i <= 100:
    #str()函数将整数转换为字符串，方便判断
    i_str = str(i)
    #判断是否是7的倍数或者包含7的数字
    if i % 7 == 0 or '7' in i_str:
        #print不换行打印
        print(i,end='  ')
    i += 1