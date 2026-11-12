import time
#car       属性    品牌   价格  轮子数量
#         方法:  上路    如果轮子数量>=4   奔跑
class car:
    def __init__(self,brand,price,wheelNum):
        self.brand = brand #注入属性
        self.price = price
        self.wheelNum = 4 #默认4个轮子
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
    def repair(self,car):   #传入car对象
        #修车,self表示当前对象
        #carFactory只有一个brand属性
        if car.wheelNum<4:
            print(f'汽车有故障,{self.brand} 正在修理')
            car.wheelNum=4
            time.sleep(3)
            print(f'{self.brand} 已修好')
        else:
            print(f'{self.brand} 无需修理')
       
#自测
if __name__ == '__main__':
    #car调用
    car_1=car('奔驰',380000,3)
    car_1.goRoad()
    time.sleep(2)
    print("出现故障")
    car_1.wheelNum-=1
    car_1.goRoad()

    #carFactory调用
    cf=carFactory('幸福修理厂')
    cf.repair(car_1)
    car_1.goRoad()
