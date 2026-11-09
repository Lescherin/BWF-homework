# 写一段代码，使用循环，生成4位数字的账号和6位数字的密码，尝试密码破解；
# 正确的账号和密码保存在userAccount中，将循环生成的账号和密码与userAccount中的信息比较，
# 如果相同，则表示破解成功，如果不相同，则生成新的账号和口令继续比较破解；直到破解除userAccount中所有账号
userAccount = {
  '1010':{'password':'190897'},
  '1102':{'password':'303030'},
  '2092':{'password':'202020'},
  '3024':{'password':'121212'}
 }
print(userAccount)

# 使用userID变量从for对应的序列1000-9999中依次取数
for userID in range(1000,10000):
    # 如果userID在userAccount存在：
    if str(userID) in userAccount:
        # 打印当前的userID
        print('查询到userID:',userID)
        # 使用pwd变量从for对应的序列100000-1000000中依次取数：
        for pwd in range(100000,1000000):
            # 判断当前变量pwd如果是userAccount中对应用户的正确密码：
            # pwd必须转为字符串，才能与userAccount中的password键名进行比较，同时userID也作为键名相对应的键名
            if str(pwd) == userAccount[str(userID)]['password']:
                # 打印当前的用户名和密码，即userID，pwd
                print('匹配成功，userID:',userID,'pwd:',pwd)
                # 中断当前循环，不再尝试下一个pwd
                break
            # 如果当前变量pwd不是userAccount中对应用户的正确密码：
            else:
                # 停止本轮的循环，进入下一次循环，获取pwd继续判断
                continue
    # 如果userID在userAccount中不存在：
    else:
        # 停止本轮的循环，进入下一个userID的循环中
        continue
