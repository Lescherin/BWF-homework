import time
#car       属性    品牌   价格  轮子数量
#         方法:  上路    如果轮子数量>=4   奔跑
class car:
    def __init__(self,brand,price,wheelNum):
        self.brand = brand #注入属性
        self.price = price
        self.wheelNum = 4   #默认4个轮子
    def goRoad(self):
        if self.wheelNum >= 4:
            print(f'{self.brand} 可以上路了')
        else:
            print(f'{self.brand} 不能上路了')



#carFactory  属性  品牌
#      方法:  修车    将汽车轮子恢复四个
class carFactory:
    def __init__(self,jwbrand):
        self.brand = jwbrand #注入属性
    def repair(self,car):    #接收car对象!!
 
        if car.wheelNum<4:
            print(f'{car.brand}汽车有故障,在{self.brand}正在修理')
            car.wheelNum=4
            time.sleep(3)
            print(f'{car.brand}汽车在{self.brand}已修好')
        else:
            print(f'{car.brand}汽车在{self.brand}未检测到故障,无需修理')
       
#自测
if __name__ == '__main__':
    #car调用
    car_1=car('奔驰',380000,4)
    car_1.goRoad()
    car_2=car('丰田',180000,4)
    car_2.goRoad()
    time.sleep(2)
    print("事故发生")
    time.sleep(2)
    
    car_1.wheelNum-=1
    print("奔驰轮子缺失")
    car_1.goRoad()
    car_2.goRoad()

    #carFactory调用
    cf=carFactory('幸福修理厂')
    cf.repair(car_1)
    cf.repair(car_2)
    car_1.goRoad()
    car_2.goRoad()
