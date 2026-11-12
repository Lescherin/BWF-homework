import re


str1 = '我爱${python},也爱${上课},最爱${睡大觉}'
#提取所有爱好

# 正则   原始字符串
# 要的是 左边${ 右边} 里面0到多个值
# $以什么结尾    表示含义  \$ 原始$
# . 单个字符  
# * 0到多个
print(re.findall(r"\${.}",str1))
print(re.findall(r"\${.*}",str1))   # 贪婪匹配   
print(re.findall(r"\${.*?}",str1))  # 非贪婪匹配



# () 括号捕获 不含边界  最常用
result = re.findall(r"\${(.*?)}",str1)
print(result[0])
print(result[1])
print(result[2])
print(result)

#需要 从一对字符串中提取电话号码  [] 第一位是1,第二位是35789,后面9位是数字  \d 任意数字
str2 = '13812315554|13311896380xxxxx'
print(re.findall(r"^1[35789]\d{9}",str2))

#身份证号  18位数字  第17位是数字  第18位是X或者数字 []匹配任意一个字符
str3 = '44030419900101001X'
print(re.findall(r"\d{17}[\d|X]",str3))
