'''
定义一个矩形类Rectangle，
定义属性：长length，宽width

定义方法：
计算面积方法：area()
计算周长方法：perimeter()

要求：
创建一个有具体长和宽值的矩形对象，调用类中方法，打印出来该矩形对象的面积和周长。'''

# 定义矩形类Rectangle
class Rectangle:
    # 初始化方法
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self):
        areaRes = self.length * self.width
        print("矩形的面积为：", areaRes)

    def perimeter(self):
        perimeterRes = 2 * (self.length + self.width)
        print("矩形的周长为：", perimeterRes)


if __name__ == "__main__":
    length = int(input("请输入矩形的长："))
    width = int(input("请输入矩形的宽："))
    # 创建矩形对象
    rect1 = Rectangle(length, width)
    # 调用方法
    rect1.area()
    rect1.perimeter()
