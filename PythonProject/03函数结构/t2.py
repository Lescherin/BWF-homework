#实现注册的功能：

#要求register()接收用户键盘输入的信息，并检测数据格式是否合法：
#要求用户名包含'@'和'.com'信息，密码长度要刚好6位
#不合法给出相应提示信息，格式合法则调用addUser()函数进行判断处理

#addUser函数判断，如果这个账号已经存在，返回信息给register，
#register说明账号已经被注册过，不能再注册，如果账号不存在，addUser添加账号到UserInfo，返回信息给register，register说明这个账号已添加

userInfo=[
{'userAccount':'Kate@qq.com','password':'123456'},
{'userAccount':'Mike@qq.com','password':'111111'}]

#接收userAccount和pwd参数，判断userAccount是否在userInfo中，如果不存在，添加到userInfo中，返回1，如果存在，返回-1
def addUser(userAccount,pwd):
    #使用for循环对userInfo列表遍历，提取记录到user
    #    如果userAccount在user['userAccount']存在:
    #        返回 -1
    #    否则:
    #        pass #什么也不做
    #添加用户信息字典到列表userInfo中
    #返回1
    for user in userInfo:
        if userAccount in user['userAccount']:
            return -1
        else:
            pass
    userInfo.append({'userAccount':userAccount,'password':pwd})
    return 1

#进行注册处理
def register():
    #从键盘输入账号信息给userAccount和password
    #如果userAccount包含'@'和'.com'信息:
    #   如果密码长度是6位:
    #   调用addUser函数，把userAccount和password传递过去，获得返回值
    #   这个if确认账号是否存在，使用addUser函数的返回值作为状态码判断
    #       如果返回值==1
    #           打印用户正常注册
    #       如果返回值==-1
    #           打印用户已经存在，不能注册
    #   如果密码长度不是6位:
    #       打印密码长度错误
    #如果userAccount不包含'@'和'.com'信息:
        #打印：用户账号应该包含'@'和'.com'信息
    print("注册账号^-^")
    userAccount = input("请输入账号：")
    password = input("请输入密码：")
    if '@' in userAccount and '.com' in userAccount:
        if len(password)==6:
            flag=addUser(userAccount,password)
            if flag==1:
                print("用户正常注册")
            elif flag==-1:
                print("用户已经存在，不能注册")
        else:
            print("密码长度错误")
    else:
        print("用户账号应该包含'@'和'.com'信息")

# 小bug：嵌套校验问题 （需要做独立校验）
# 用户名时不规范，密码校验都不会执行，我认为检验用户名的同时需要检验密码长度

register()        # 调用register
