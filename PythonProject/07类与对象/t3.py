'''
定义一个汽车类Car，

定义属性：车牌号 plate_number,初始油量 fuel；

定义方法：drive(distance)
说明：distance是行驶距离，每行驶1公里消耗0.5单位油
drive方法需要返回消耗的油量

定义方法：check_fuel()
说明：用来显示剩余的油量

要求：创建一个汽车对象，初始油量50，驾驶100公里后输出剩余油量
'''
class Car:
    def __init__(self,plate_number,fuel):
        self.plate_number=plate_number
        self.fuel=fuel

    def drive(self, distance):          
        cost = distance * 0.5           # 计算消耗的油量
        print(f"{self.plate_number} 行驶 {distance} 公里，已消耗的油量为：{cost}")
        return cost                     # 返回消耗的油量

    def check_fuel(self,cost):
        self.fuel -= cost               # 计算剩余油量
        print(f"{self.plate_number} 剩余油量为：{self.fuel}")
        
if __name__ == "__main__":
    plate_number='沪A 114514'
    fuel=50
    
    car1=Car(plate_number,fuel)
    cost=car1.drive(100)    # 调用drive方法，变量cost接收返回值消耗的油量
    car1.check_fuel(cost)