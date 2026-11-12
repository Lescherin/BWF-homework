#python面向对象
# 1 类的定义
# 2 类中方法的定义
# 3 对象的创建 类名(参数1, 参数2, ...)
# 4 调用方法 对象名.方法名()


# 创建一个类 Person
class Person:
    # 1 对象类中定义属性 
    def __init__(self, name, age, sex):  # 初始化方法 形参 self是对象本身
        # 初始化属性
        self.name = name #注入属性
        self.age = age
        self.sex = sex
    # 2 对象类中定义方法
    def say(self):
        print(f"我是 {self.name}，我今年 {self.age} 岁，我是 {self.sex}")
    def get_age(self):
        print(f"我今年: {self.age}")

#main自测分支
if __name__ == "__main__":
    
    name = input("请输入姓名: ")
    age = int(input("请输入年龄: "))
    sex = input("请输入性别: ")
    # 3 对象的创建 (实例化对象)
    #匿名调用(__init__)初始化方法，给对象赋值
    #匿名调用类似隐式调用 没有显式写__init__方法，会自动调用__init__方法
    #显式调用:  p1 = Person.__new__(Person)
    #          p1.__init__(name, age, sex)
    p1 = Person(name, age, sex)

    # 4 对象调用方法 运行  对象名.方法名()
    p1.say()
    p1.get_age()
