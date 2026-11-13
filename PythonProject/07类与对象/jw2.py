import time

class car:
    def __init__(self,brand,price):
        self.brand = brand #注入属性
        self.price = price
        self.wheelNum = 4   #默认4个轮子
    def goRoad(self):
        if self.wheelNum >= 4:
            print(f'{self.brand} 可以上路了')
        else:
            print(f'{self.brand} 不能上路了')

    # __gt__：大于运算符重载方法
    def __gt__(self, other):
        if self.price > other.price:
            return f'{self.brand} 价格更贵'
        else:
            return f'{other.brand} 价格更贵'

if __name__ == '__main__':
    # 实例化对象：car(...) 会自动调用 __init__，把参数传进去初始化属性
    # 类似 Java 的 new car(brand, price, wheelNum)，构造器自动执行
    c1 = car('奔驰',2000000)
    c2 = car('比亚迪',1200000)

    # 重载运算符
    print (c1>c2)
