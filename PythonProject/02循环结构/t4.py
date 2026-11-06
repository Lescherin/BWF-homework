# year,month,day=键盘接收年月日数据，保存在三个变量中
input_Tmp = input("请输入一个年月日，用/隔开：")
jwList = input_Tmp.split("/")
year = int(jwList[0])
month = int(jwList[1])
day = int(jwList[2])
print(jwList)

totalDay = 0
bigMonth = [1, 3, 5, 7, 8, 10, 12]
smlMonth = [4, 6, 9, 11]

# 如果月份month在bigMonth，属于大月：
if month in bigMonth:
    if day in range(1, 32):
        print("日期合法")
        totalDay = day
        print("当前月份的第%d天" % totalDay)
    else:
        print("日期非法")

# 如果月份month在smlMonth，属于小月：
elif month in smlMonth:
    if day in range(1, 31):
        print("日期合法")
        totalDay = day
        print("当前月份的第%d天" % totalDay)
    else:
        print("日期非法")

# 如果月份month是二月份：
else:
    # 判断闰年
    isLeap = (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)
    if isLeap:
        # 闰年，二月最多29天
        if day in range(1, 30):
            print("日期合法")
            totalDay = day
            print("当前月份的第%d天" % totalDay)
        else:
            print("日期非法")
    else:
        # 平年，二月最多28天
        if day in range(1, 29):
            print("日期合法")
            totalDay = day
            print("当前月份的第%d天" % totalDay)
        else:
            print("日期非法")
