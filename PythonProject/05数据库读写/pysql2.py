#insert增加数据 into 表名(字段1,字段2,字段3...) values(值1,值2,值3...)
import pymysql

def insert_data(host,user,password,database):
    #1.连接数据库
    jwDbCon=pymysql.connect(host=host,user=user,password=password,db=database)
    print(jwDbCon)

    #2.创建游标  cursor对象作用：执行SQL语句
    jwCursor=jwDbCon.cursor()

    #2.1执行SQL语句 使用try-except语句处理事务
    try:
        sql1='insert into xsb(xh,xm,xb,jg,nl,bj,sfzh,zcrq) values("098","李老白,"男","北京",24,"3班","340322199005267765","2024-01-01")'
        sql2='insert into xsb(xh,xm,xb,jg,nl,bj,sfzh,zcrq) values("098","杨过","男","北京",24,"3班","340322199005267765","2024-01-01")'
        jwCursor.execute(sql1)       # 执行SQL
        jwCursor.execute(sql2)       # 成功：提交事务，数据真正写入数据库

        print('插入成功')
        print(f'影响行数：{jwCursor.rowcount}')  # INSERT无结果集，用rowcount看影响行数
    except Exception as e:
        jwDbCon.rollback()          # 失败：回滚事务，撤销未提交的更改，保证数据一致性

        print('本次插入失败，触发回滚事务')
        print(type(e).__name__, e)
    finally:
        #关闭数据库游标和数据库连接
        jwCursor.close()
        jwDbCon.close()

if __name__ == '__main__':
    insert_data('127.0.0.1','root','root','bwf')