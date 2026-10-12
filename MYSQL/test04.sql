-- Active: 1791599933106@@127.0.0.1@3306@studysql
--子查询
--查徐娟 gno=101 sno=2
SELECT gno,sno
FROM student
WHERE sname='徐娟';

-- = OR In用法
SELECT *
FROM score
WHERE sno = (SELECT sno FROM student WHERE sname='徐娟')
AND   gno = (SELECT gno FROM student WHERE sname='徐娟');

--简便用法 主键联合做条件
SELECT *
FROM score
WHERE (sno,gno) = (SELECT sno,gno FROM student WHERE sname='徐娟');

SELECT *
FROM score
WHERE (sno,gno) IN (SELECT sno,gno FROM student WHERE sname IN('钱姣','徐娟'));



--每个籍贯学生数
SELECT address,count(sname)
FROM student
GROUP BY address;

--优化  子查询中建表（别名TMP_STU）进行SUBSTRING处理 省份截取2位并作为分组条件
SELECT TMP_STU.JG,count(sname)
FROM (SELECT sname,SUBSTRING(address,1,3) JG FROM student) TMP_STU
GROUP BY TMP_STU.JG;

--吴丹的linux分数
--score表 拿gno101,sno1连接sname=吴丹  拿lno2连接lname=‘Linux’

SELECT *
FROM  score
WHERE (gno,sno) IN (SELECT gno,sno FROM student WHERE sname='吴丹')
AND  lno = (SELECT lno FROM lesson WHERE lname='Linux');

--交叉连接
SELECT *
FROM lesson,grade;

SELECT *
FROM lesson
CROSS JOIN grade;

--内连接
SELECT SC.gno ,SC.sno,ST.sname,SC.score
FROM score AS SC
JOIN student AS ST ON SC.gno=ST.gno AND SC.sno=ST.sno
WHERE sname='钱姣';

SELECT  *
FROM grade AS GR , teacher AS TE
WHERE TE.tno=GR.tno and TE.tname LIKE '宋%' ;



--每门课程平均分
SELECT a.lno,a.lname,AVG(b.lno)
FROM lesson a
JOIN score b on a.lno=b.lno
GROUP BY a.lno DESC;

--查询孙某测试课程的分数
SELECT ST.sname,LE.lno,LE.lname,SC.score
FROM lesson AS LE
JOIN score AS SC ON SC.lno=LE.lno
JOIN student AS ST ON ST.sno = SC.sno AND ST.gno = SC.gno 
WHERE LE.lname LIKE '测试%' AND ST.sname LIKE '孙%';

--外连接
--学生的信息与考试分数，不管是否参加考试都要显示

SELECT a.sname,b.lno,b.score
FROM student a 
JOIN score b on (a.gno,a.sno)=(b.gno,b.sno);

SELECT a.sname,b.lno,b.score
FROM student a 
left JOIN score b on (a.gno,a.sno)=(b.gno,b.sno);

INSERT INTO student
VALUES(101,5,'刘备','四川','sh19990511@std.com',23,11451419190);

--学生的哪个课程是缺考的
--（先使用学生跟班级交叉连接 再进行左外连接查看学生班级 对成绩NULL）
SELECT a.sname,b.lname,c.score
FROM student a
CROSS JOIN lesson b 
LEFT JOIN score c ON (a.gno,a.sno)=(c.gno,c.sno) 
  AND b.lno=c.lno
WHERE c.score IS NULL;

SELECT a.sname,b.lno,b.score
FROM student a 

LEFT JOIN score b on (a.gno,a.sno)=(b.gno,b.sno)
UNION 
SELECT a.sname,b.lno,b.score
FROM student a 
RIGHT JOIN score b on (a.gno,a.sno)=(b.gno,b.sno);

UPDATE student SET address='黑龙江省' WHERE sname = '刘备';

SELECT ST.sname,LE.lno,LE.lname,SC.score,if(SC.score>=60,'及格','不及格') AS 是否及格
FROM lesson AS LE
JOIN score AS SC ON SC.lno=LE.lno
JOIN student AS ST ON ST.sno = SC.sno AND ST.gno = SC.gno; 

--每个学生平均成绩是否及格 双分支
SELECT if(AVG(score)>60,'平均合格','平均不合格') AS 平均成绩 ,A.gno,A.sno,B.sname
from score A
join student B ON (B.sno,B.gno)=(A.sno,A.gno)
GROUP BY A.gno,A.sno;

--多重分支 CASE WHEN条件 THEN返回值 ELSE返回值 END
SELECT ST.sname,LE.lno,LE.lname,SC.score,
  CASE 
    WHEN SC.score BETWEEN 60 AND 69 THEN '及格'
    WHEN SC.score BETWEEN 70 AND 79 THEN '中等'
    WHEN SC.score BETWEEN 80 AND 89 THEN '良好'
    WHEN SC.score BETWEEN 90 AND 100 THEN '优秀'
    ELSE '不及格'
  END AS 成绩档位
FROM lesson AS LE
JOIN score AS SC ON SC.lno=LE.lno
JOIN student AS ST ON ST.sno = SC.sno AND ST.gno = SC.gno; 

SELECT ST.sname,LE.lno,LE.lname,SC.score,
  CASE sname
    WHEN CHAR_LENGTH(sname) = 2 THEN '两个字'
    WHEN CHAR_LENGTH(sname) = 3 THEN '三个字'
    ELSE '不及格'
  END AS 名字个数
FROM lesson AS LE
JOIN score AS SC ON SC.lno=LE.lno
JOIN student AS ST ON ST.sno = SC.sno AND ST.gno = SC.gno; 

--籍贯中市、省不显示  SUBSTRING(address,1,CHAR_LEN(address) -1 ) 最后一个字删除
SELECT sname,
    CASE 
        WHEN address LIKE '%市' THEN SUBSTRING(address,1,CHARACTER_LENGTH(address) -1)
        WHEN address LIKE '%省' THEN SUBSTRING(address,1,CHARACTER_LENGTH(address) -1)
        ELSE  address 
    END AS 籍贯
FROM student;

SELECT sname,
    CASE 
        WHEN SUBSTRING(address,-1) = '市' THEN SUBSTRING(address,1,CHARACTER_LENGTH(address) -1)
        WHEN SUBSTRING(address,-1) = '省' THEN SUBSTRING(address,1,CHARACTER_LENGTH(address) -1)
        ELSE  address 
    END AS 籍贯
FROM student;

SELECT sname,address,REPLACE(REPLACE(address,'省',''),'市','') AS 籍贯
FROM student;