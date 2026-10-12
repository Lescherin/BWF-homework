-- Active: 1791599933106@@127.0.0.1@3306@studysql

-- 查询

SELECT 11,22,33
FROM lesson;


SELECT *
FROM student;

SELECT sname,age,sname
FROM student;


-- 去重
SELECT DISTINCT age
FROM student;

SELECT DISTINCT gno,age
FROM student;

-- 别名
SELECT 11 学号,22 班级号,33 课程号
FROM student s;



-- 条件
-- 年龄21到23之间的河南的学生
SELECT *
FROM student
WHERE age>=21 and age<=23 AND address='河南';


SELECT *
FROM student
WHERE address='河南' and (age>=21 and age<=23);


-- 范围
SELECT *
FROM student
WHERE age BETWEEN 21 and 23 AND address='河南';


-- 集合
-- 上海，河南，江西，江苏的学生
SELECT *
FROM student
WHERE address='上海' or address='河南' or address='江西' or address='江苏';



SELECT *
FROM student
WHERE address in('上海','河南','江西','江苏');


SELECT *
FROM student
WHERE address not in('上海','河南','江西','江苏');


-- 空值
UPDATE student set telephone=NULL WHERE sname='吴丹';
UPDATE student set telephone='' WHERE sname='宋亚茹';



SELECT *
FROM student
WHERE telephone is NULL;


SELECT *
FROM student
WHERE telephone='';


-- 模糊条件
-- 电话号码第6位是1的学生
SELECT *
FROM student
WHERE telephone LIKE '_____1%';


-- 函数
SELECT CONCAT(sname,age)
FROM student;


SELECT *
FROM student
WHERE CONCAT(sname,age)='吴丹20';



SELECT email,SUBSTRING(email,10,3)
FROM student;

-- email的@前面3位为303到305的学生
SELECT *
FROM student
WHERE SUBSTRING(email,10,3) in ('303','304','305');

SELECT sname,LENGTH(sname),CHAR_LENGTH(sname)
FROM student;

-- 名字2个字
SELECT *
FROM student
WHERE CHAR_LENGTH(sname)=2;


-- 数字处理
SELECT ROUND(12.3456,3),TRUNCATE(12.3456,3);


SELECT ROUND(12.5456);


SELECT MOD(10,3),10%3;


-- 日期
SELECT NOW(),CURTIME();


SELECT WEEKDAY(now());

SELECT WEEKDAY('1927-08-01');



-- 分组统计
-- 所有学生平均年龄，最老的学生

SELECT sname,avg(age),max(age),GROUP_CONCAT(sname)
FROM student;


SELECT sname,age
FROM student;


-- 不同地方学生的平均年龄
SELECT address,avg(age),GROUP_CONCAT(sname)
FROM student
GROUP BY address;



-- 每个班级不同地方学生的平均年龄：

SELECT gno,address,avg(age),GROUP_CONCAT(sname)
FROM student
GROUP BY gno,address;




-- 不同地方学生的平均年龄是22及以上
SELECT address,avg(age),GROUP_CONCAT(sname)
FROM student
GROUP BY address
HAVING avg(age)>=22;


-- 统计1月2日到1月4日，每个教室上课次数
SELECT clsroom,COUNT(*)
from schedule
WHERE ldate>='2019-01-02' and ldate<='2019-01-04'
GROUP BY clsroom;


SELECT *
from schedule
WHERE ldate>='2019-01-02' and ldate<='2019-01-04';


SELECT clsroom,COUNT(*)
from schedule
WHERE ldate>='2019-01-02' and ldate<='2019-01-04'
GROUP BY clsroom
HAVING COUNT(*)>=3;


-- 上课次数倒序
SELECT clsroom,COUNT(*)
from schedule
WHERE ldate>='2019-01-02' and ldate<='2019-01-04'
GROUP BY clsroom
ORDER BY COUNT(*) DESC;


-- 学生   班级升序，年龄降序
SELECT *
FROM student
ORDER BY gno,age desc;

SELECT *
FROM student
ORDER BY age DESC
LIMIT 0,3;

SELECT *
FROM student
ORDER BY age DESC
LIMIT 3,7;

USE  studysql;