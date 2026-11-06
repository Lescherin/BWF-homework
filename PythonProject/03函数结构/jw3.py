def jwadd(*args,**kwargs):
    #print(kwargs){'author':'admin','date':'2026-11-05'}
    result=0
    #根据 [] 内key获取对应的value
    #{}格式化字符串
    for arg in args:
        result+=arg
    return f'代码：{kwargs["author"]}在{kwargs["date"]}为你计算{result}'

#调用
print(jwadd(1,2,3,4,5,author='admin',date='2026-11-05'))
