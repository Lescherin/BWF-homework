# 类与对象：好比动物分类中，"猫科"是类（抽象模板），"你家的那只猫"是对象（具体实例）
# 类中定义的属性和方法是所有对象共有的（类属性、类方法）
# 每个对象还可以有自己独有的属性（实例属性）

# 创建一个类 Person

class Person:
    # 类属性：定义在类中、方法外，所有对象共享同一份
    # 不需要创建对象就能用：Person.nationality
    nationality = "中国"
    ethnicity = "汉族"

    # 类方法：用 @classmethod 装饰，第一个参数是 cls（代表类本身，不是对象）
    @classmethod
    def identify(cls):
        # 类方法内部通过 cls 访问类属性
        print(f"我是 {cls.nationality} 人,民族是 {cls.ethnicity} ")
        # 类方法中可以直接用类名 Person 访问 类属性
        print(f"我是 {Person.nationality} 人,民族是 {Person.ethnicity} ")


    # __init__：初始化方法（构造方法），创建对象时自动调用，不需要手动写方法名
    # self 代表"当前正在创建的对象本身"，相当于 Java 里的 this 指向当前对象的引用 ！！！
    def __init__(self, name, age, sex):
        # 实例属性：每个对象各自拥有一份，互不影响
        self.name = name
        self.age = age
        self.sex = sex

    # 实例方法：第一个参数是 self，通过 self 访问实例属性
    def say(self):
        print(f"我是 {self.name}，我今年 {self.age} 岁，性别是 {self.sex}")
    def get_age(self):
        print(f"我今年: {self.age}岁")

#   main自测分支
if __name__ == "__main__":
    
    name = input("请输入姓名: ")
    age = int(input("请输入年龄: "))
    sex = input("请输入性别: ")

    # 实例化对象：Person(...) 会自动调用 __init__，把参数传进去初始化属性
    # 类似 Java 的 new Person(name, age, sex)，构造器自动执行
    p1 = Person(name, age, sex)

    # 调用类方法1：对象调用类方法 对象.类方法名()
    p1.identify()
    # 调用类方法2：类名调用类方法 类名.类方法名()
    Person.identify()

    # 调用对象方法：对象.对象方法名()
    p1.say()
    p1.get_age()

