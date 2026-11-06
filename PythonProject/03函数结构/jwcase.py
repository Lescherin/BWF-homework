# 1.数据区(学生数据--包含 名字  性别  电话号码)
#数据--字典 列表 元组
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
def  addStuInfo():
    pass

# 4.功能2修改学生
def modifyStuInfo():
    pass
# 5.功能3查询学生
def showStuInfo():
    pass

#6.用户交互函数---程序启动函数～ 自己封装程序起点～
def  jw_main():
    while True:
        printMenu()  # 依次调试~
        try:
            key=input('请输入数字，选择功能')#字符串
            if key=='1':
                print('开始增加学生。。。')
                addStuInfo()
            elif key=='2':
                print('开始删除学生。。。')
            elif key=='3':
                print('开始修改学生。。。')
                modifyStuInfo()
            elif key=='4':
                print('开始查询学生。。')
                showStuInfo()
            elif key=='0':
                print('byebye~~')
                return  #break
        except:
            print('主人不要逗我，重新输入～')

if __name__ == '__main__': #自测分支
    jw_main() #启动程序 ～
