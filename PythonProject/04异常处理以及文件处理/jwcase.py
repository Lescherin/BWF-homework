import sys

# 1.数据区(学生数据--包含 名字  性别  电话号码)
#数据--字典  列表       元组 字符串不考虑，无法直接操作
stuInfo = []  #等待增加数据

# 2.界面(客套 | 告诉用户功能)
def printMenu():
    print("="*30) #30个=
    print("===欢迎来到学生管理系统v1.0=======")
    print("1.添加学生信息")
    print("2.删除学生信息")
    print("3.修改学生信息")
    print("4.显示学生信息")
    print("0.退出学生信息系统")
    print("=" * 30)  # 30个=
    
# 3.功能1新增学生
def addStuInfo():
    newName = input('请输入学生姓名：')
    newGender = input('请输入学生性别：')
    newPhone = input('请输入学生电话号码：')
    #组装字典
    newInfo={'name':newName,'gender':newGender,'phone':newPhone}
    #{name':newName,'gender':newGender,'phone':newPhone}
    stuInfo.append(newInfo)
    print('新增学生成功')

# 4.功能2删除学生
def deleteStuInfo():
    print('删除学生信息')
    # 1 2 3 自然数第几个学生
    newName = input('请输入学生姓名：')
    newGender = input('请输入学生性别：')
    newPhone = input('请输入学生电话号码：')
    
    #判断学生是否存在
    if {'name':newName,'gender':newGender,'phone':newPhone} not in stuInfo:
        print('删除失败，学生不存在')
        return
    else:
        stuInfo.pop(stuInfo.index({'name':newName,'gender':newGender,'phone':newPhone}))
        print('删除学生成功')

# 5.功能3修改学生
def modifyStuInfo():
    print('修改学生信息')
    # 1 2 3 自然数第几个学生
    stuID=int(input('请输入要修改序号'))
    newName = input('请输入学生姓名：')
    newGender = input('请输入学生性别：')
    newPhone = input('请输入学生电话号码：')
    #stuID-1 是要修改的键对应下标，所以要减1
    stuInfo[stuID-1]={'name':newName,'gender':newGender,'phone':newPhone}
    print('修改学生成功')

# 6.功能4查询学生
def showStuInfo():
    print('学生信息如下')
    print("="*30)
    print('序号\t姓名\t性别\t电话号码')
    print("="*30)
    for stuID,stu in enumerate(stuInfo):
        print(f"{stuID + 1}\t{stu['name']}\t{stu['gender']}\t{stu['phone']}")




#7.用户交互函数---程序启动函数～ 自己封装程序起点～
def  jw_main():
    # 检测是否为交互式终端，非交互环境下所有input()都会秒返回，导致函数直接结束回菜单
    if not sys.stdin.isatty():
        print('错误：当前环境不支持交互式输入！')
        print('请在真实终端(cmd/PowerShell)中运行：python jwcase.py')
        return
    while True:
        printMenu()  # 依次调试~
        try:
            key = input('请输入数字，选择功能')  # 字符串
            # 空输入视为输入流结束（部分IDE不抛EOFError而是返回空串），避免无限循环
            if key == '':
                print('\nbyebye~~')
                return
            if key == '1':
                print('开始增加学生。。。')
                addStuInfo()
            elif key == '2':
                print('开始删除学生。。。')
            elif key == '3':
                print('开始修改学生。。。')
                modifyStuInfo()
            elif key == '4':
                print('开始查询学生。。')
                showStuInfo()
            elif key == '0':
                print('byebye~~')
                return  # break
        except Exception as e:
            print(f'输入有误：{e}，主人不要逗我，请重新输入～')
    



if __name__ == '__main__': #自测分支
    jw_main() #启动程序 ～

