import pymysql

#1.连接数据库
jwDbCon=pymysql.connect(host='127.0.0.1',user='root',password='root',database='BWF')
print(jwDbCon)
 
#2.创建游标  cursor对象作用：执行SQL语句
jwCursor=jwDbCon.cursor()

#2.1执行SQL语句
sql='select * from xsb'
jwCursor.execute(sql)  #查询结果集存储在游标cursor中

#2.2获取查询结果 fetchone() 作用：取出cursor对象中的第一个结果集
#cursor类似文件指针
print(jwCursor.fetchone()) #取出第1个结果集
print(jwCursor.fetchone()) #取出第2个结果集
print(jwCursor.fetchone()) #取出第3个结果集
print(jwCursor.fetchmany(3))#取出后3个结果集，返回元组类型
print(jwCursor.fetchall())#取出所有结果集
#如果指定某一条结果集，需要使用索引获取
jwCursor.close()

jwCursor=jwDbCon.cursor()
sql='select * from xsb'
jwCursor.execute(sql) 
print(jwCursor.fetchall()[2]) #取出第三条结果集，返回元组类型


#3.关闭游标和数据库连接
jwCursor.close()
jwDbCon.close()
