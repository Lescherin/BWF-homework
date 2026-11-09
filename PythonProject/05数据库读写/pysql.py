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
result=jwCursor.fetchall()
print(result[0]) #取出第一个结果集，返回元组类型


#3.关闭
jwCursor.close()
jwDbCon.close()
