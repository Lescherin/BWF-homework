#开发一个功能函数，可以用户提供指定的数据
import pymysql

def jw_my_data(n,host,user,pwd,db,sql='select * from xsb'):  #可变形参
    DbCon=pymysql.connect(host=host,user=user,password=pwd,database=db)
    # 新建游标对象 用游标字典
    cursor =  DbCon.cursor(pymysql.cursors.DictCursor)
    cursor.execute(sql)
    #all_data=cursor.fetchall()
    print(cursor.fetchmany(3)[n]) #n索引下表数据，返回字典类型
    #print(all_data[n])
    cursor.close()
    DbCon.close()

#自测
if __name__ == '__main__':
    jw_my_data(1,'127.0.0.1','root','root','bwf','select * from kcb')