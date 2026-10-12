-- 一、理论、数据库 & 表 DDL、DML 增删改（1‑30）

-- 1.写出查看 MySQL 服务器中所有数据库的 SQL 语句。
SHOW DATABASES;

-- 2.创建数据库studysql，设置字符集 utf8，排序规则utf8_general_ci。
CREATE DATABASE studysql
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 3.使用studysql这个数据库。
USE studysql;

-- 4.查看当前库下面所有的数据表。
SHOW TABLES;

-- 5.写出查看grade表表结构的 SQL 命令。
DESCRIBE grade;

-- 6.删除lesson数据表，写出对应 SQL。
DROP TABLE lesson;

-- 7.参考文档给出结构，完整写出创建lesson课程表的create table语句。
CREATE TABLE lesson (
    lno INT PRIMARY KEY,
    lname VARCHAR(50) NOT NULL,
    ldesc VARCHAR(200)
);

-- 8.在teacher表增加新字段sex，枚举类型enum('男','女')，允许为空。
ALTER TABLE teacher
ADD sex ENUM('男', '女');

-- 9.将 teacher 表刚刚新增的sex字段，修改类型为varchar(4)。
ALTER TABLE teacher
MODIFY sex VARCHAR(4);

-- 10.删除 teacher 表中的sex字段。
ALTER TABLE teacher
DROP COLUMN sex;

-- 11.将schedule表重命名为schedule_backup。
ALTER TABLE schedule
RENAME TO schedule_backup;

ALTER TABLE schedule_backup RENAME TO schedule;

-- 12.向 grade 班级表插入记录：gno=285，gname=' 上海 285 期 '，tno=1，BeginDate='2026‑09‑01'。
INSERT INTO grade (gno, gname, tno, BeginDate)
VALUES (285, '上海 285 期', 1, '2026-09-01');

-- 13.向 grade 表插入第二条记录：gno=286，gname=' 上海 286 期 '，tno 为 null，BeginDate='2026‑09‑10'。
INSERT INTO grade (gno, gname, tno, BeginDate)
VALUES (286, '上海 286 期', NULL, '2026-09-10');

-- 14.向 student 学生表插入完整记录：gno=285，sno=1，sname=' 张三 '，address=' 上海 '，email='zs@qq.com'，age=21，telephone='13800001111'。
INSERT INTO student (gno, sno, sname, address, email, age, telephone)
VALUES (285, 1, '张三', '上海', 'zs@qq.com', 21, '13800001111');

-- 15.使用指定字段的 insert 写法，给 student 插入：gno=285，sno=2，sname=' 李四 '，其余字段全部不赋值。
INSERT INTO student (gno, sno, sname)
VALUES (285, 2, '李四');

-- 16.批量插入 2 条 teacher 讲师数据：tno=1,tname=' 王讲师 '；tno=2,tname=' 李讲师 '，其余字段全部为 null。
INSERT INTO teacher (tno, tname)
VALUES (1, '王讲师'), (2, '李讲师');

-- 17.向 lesson 课程表插入：lno=1，lname='MySQL 数据库 '，ldesc=' 关系数据库入门学习 '。
INSERT INTO lesson (lno, lname, ldesc)
VALUES (1, 'MySQL 数据库', '关系数据库入门学习');

-- 18.向 score 成绩表插入记录：gno=285，sno=1，lno=1，score=85。
INSERT INTO score (gno, sno, lno, score)
VALUES (285, 1, 1, 85);

-- 19.向 schedule 排课表插入排课：ldate='2026‑09‑15'，gno=285，lno=1，tno=1，clsroom='1505 教室 '。
INSERT INTO schedule (ldate, gno, lno, tno, clsroom)
VALUES ('2026-09-15', 285, 1, 1, '1505 教室');

-- 20.更新 student 表，把张三的 age 年龄修改为 22 岁。
UPDATE student
SET age = 22
WHERE sname = '张三';

-- 21.更新 grade 表，gno=286 这条记录，把 tno 设置为 2。
UPDATE grade
SET tno = 2
WHERE gno = 286;

-- 22.更新 score 表，把表中所有 score 分数统一加 3 分。
UPDATE score
SET score = score + 3;

-- 23.更新 student 表，所有 address=' 上海 ' 的学生，age 增加 1。
UPDATE student
SET age = age + 1
WHERE address = '上海';

-- 24.删除 student 表中 gno=285，sno=2 的学生记录。
DELETE FROM student
WHERE gno = 285 AND sno = 2;

-- 25.删除 score 表中 score 等于 0 的全部成绩记录。
DELETE FROM score
WHERE score = 0;

-- 26.删除 schedule 表中 clsroom='1505 教室 ' 的排课记录。
DELETE FROM schedule
WHERE clsroom = '1505 教室';

-- 27.使用 delete 语句，清空 score 整张表里所有数据。
DELETE FROM score;

-- 28.使用 truncate 语句清空 score 表全部数据。
TRUNCATE TABLE score;

-- 29.使用 drop 删除 score 数据表。
DROP TABLE score;

-- 30.删除 schedule 表中 tno=2 的排课记录。
DELETE FROM schedule
WHERE tno = 2;
-- 二、单表基础查询、别名、distinct、where 基础条件（31‑60）

-- 31.查询 student 表，查询表里面全部行、全部列。
SELECT * FROM student;

-- 32.查询 student 表，只查询 sname、age、telephone 三列。
SELECT sname, age, telephone
FROM student;

-- 33.查询 grade 表，取出 gno、gname，给 gno 起别名班级编号，gname 起别名班级名称。
SELECT gno AS 班级编号, gname AS 班级名称
FROM grade;

-- 34.查询 teacher 全部数据，给 teacher 表设置简短别名t。
SELECT * FROM teacher t;

-- 35.查询 student 表所有 age，去除结果中重复的年龄。
SELECT DISTINCT age
FROM student;

-- 36.查询 lesson 表的 lname 课程名称，去除重复课程名。
SELECT DISTINCT lname
FROM lesson;

-- 37.查询 score 表全部成绩，输出 gno，sno，lno，score；给 score 列起别名考试分数。
SELECT gno, sno, lno, score AS 考试分数
FROM score;

-- 38.查询 student 表，找出 age 等于 21 的所有学生全部信息。
SELECT * FROM student
WHERE age = 21;

-- 39.查询 student 表，年龄大于等于 20 并且小于等于 23，输出 sname，age。
SELECT sname, age FROM student
WHERE age >= 20 AND age <= 23;

-- 40.查询 student 表，住址是上海 或者 年龄大于 22 的学生，输出 sname、address、age。
SELECT sname, address, age FROM student
WHERE address = '上海' OR age > 22;

-- 41.查询 teacher 表，查询 tno 不等于 2 的讲师全部信息。
SELECT * FROM teacher
WHERE tno <> 2;

-- 42.查询 student 表，查询年龄不是 21 岁的学生。
SELECT * FROM student
WHERE age != 21;

-- 43.使用between and，查询 student 表年龄在 20~24 之间的学生。
SELECT * FROM student
WHERE age BETWEEN 20 AND 24;

-- 44.查询 grade 表，班级编号 gno 在集合 (285,287,289) 中的班级全部信息，使用 in 关键字。
SELECT * FROM grade
WHERE gno IN (285, 287, 289);

-- 45.查询 student 表，地址不在 (' 上海 ',' 江苏 ') 的学生记录，使用not in。
SELECT * FROM student
WHERE address NOT IN ('上海', '江苏');

-- 46.查询 score 表，分数大于等于 60 分的成绩记录。
SELECT * FROM score
WHERE score >= 60;

-- 47.查询 student 表：age>20 and address=' 上海 '，输出 sname，age，address。
SELECT sname, age, address FROM student
WHERE age > 20 AND address = '上海';

-- 48.查询 teacher 表，条件not (tno=1)，输出讲师全部信息。
SELECT * FROM teacher
WHERE NOT (tno = 1);

-- 49.查询 schedule 表，ldate='2026‑09‑15' 的所有排课记录。
SELECT * FROM schedule
WHERE ldate = '2026-09-15';

-- 50.查询 score 表，分数大于 70 或者 分数小于 40 的记录。
SELECT * FROM score
WHERE score > 70 OR score < 40;

-- 51.查询 student 表，年龄 >=18 并且 年龄 <=30，并且 address=' 安徽 ' 的学生。
SELECT * FROM student
WHERE age >= 18 AND age <= 30 AND address = '安徽';

-- 52.查询 grade 表，BeginDate >= '2026‑09‑01' 的班级。
SELECT * FROM grade
WHERE BeginDate >= '2026-09-01';

-- 53.查询 score 表，score 对 10 取模等于 5 的记录。
SELECT * FROM score
WHERE MOD(score, 10) = 5;

-- 54.查询 student 表，age+1>22 的学生信息。
SELECT * FROM student
WHERE age + 1 > 22;

-- 55.查询 lesson 表，lno >=1 并且 lno <=10 的课程。
SELECT * FROM lesson
WHERE lno >= 1 AND lno <= 10;

-- 56.查询 teacher 表，telephone 不为 null 的讲师姓名 tname。
SELECT tname
FROM teacher
WHERE telephone is NOT NULL;

-- 57.查询 schedule 表，clsroom 不为 null 的排课，输出 ldate、clsroom。
SELECT  ldate,clsroom
FROM    schedule
WHERE clsroom IS NOT NULL;

-- 58.查询 score 表，score*1.05 之后大于 90 的记录。
SELECT *
FROM  score
WHERE  score*1.05>90;

-- 59.查询 student 表，条件 age!=22 or address=' 江西 '，输出 sname,age,address。
SELECT sname,age,address
FROM student
WHERE   age!=22 or address=' 江西 '    ;

-- 60.查询 grade 表，gno>284 and gno<288 的班级。
SELECT  *
FROM grade
WHERE gno>284 and gno<288      ;

-- 三、null 空值判断、模糊查询 like、MySQL 内置函数（61‑75）
-- 笔记重点区分：null和空字符串''；_、%通配符；字符、数字、日期函数

-- 61.查询 student 表，telephone 手机号为 null 的学生。
SELECT *
FROM student
WHERE telephone is NULL      ;


-- 62.查询 student 表，address 是空字符串''的学生。
SELECT *
FROM student
WHERE address=''      ;

-- 63.查询 student 表，telephone 不为 null 的学生姓名和手机号。
SELECT *
FROM student
WHERE telephone IS NOT NULL;

-- 64.查询 student，使用 like 模糊查询，找出所有姓 “张” 的学生。
SELECT *
FROM student
WHERE  sname LIKE  '张%'   ;

-- 65.查询 student，名字第二个汉字是 “三” 的学生。
SELECT *
FROM student
WHERE  sname LIKE  '_三%'   ;

-- 66.查询 student，姓名中包含 “王” 字的全部学生。
SELECT *
FROM student
WHERE  sname LIKE  '%王%'    ;

-- 67.查询 student，姓名刚好两个汉字的学生记录。
SELECT * 
FROM student
WHERE sname LIKE '__';

-- 68.使用concat()函数，查询 student，拼接输出格式姓名(手机号)，列别名 info。
SELECT concat(sname,'(',telephone,')') AS info
FROM student;

-- 69.使用substring()截取 email，截取邮箱 @符号前面部分。 
--(学习LOCATE函数匹配进行切片） LOCATE定位到@符号 -1
SELECT SUBSTRING(email,1,LOCATE('@',email) -1)
FROM student;

-- 70.使用char_length()，查询每个学生姓名的字符长度，输出 sname 和长度。
SELECT sname,CHAR_LENGTH(sname) AS '姓名长度'
FROM student;

-- 71.使用round()函数，查询 score 表，把 score 除以 2，保留 2 位小数。
SELECT ROUND(score/2,2)
FROM score;

-- 72.使用truncate()，把 score 除以 2，直接截取保留 2 位小数，不四舍五入。
SELECT TRUNCATE(score/2,2)
FROM score;

-- 73.查询now()、curtime()，获取当前完整日期时间、只获取当前时间。
SELECT now() AS 当前完整日期时间 ,CURTIME() AS 当前时间;

-- 74.查询weekday ('2026‑09‑01') 得到该日期是星期几。
SELECT WEEKDAY('2026-09-01') ;

-- 75.查询 score 表，mod (score,7) 求分数除以 7 的余数。
SELECT score,mod(score,7)
FROM score;

--四、聚合函数、group by 分组、having、order by 排序（76‑90）
--笔记范围：max/min/avg/sum/count；group by 单 / 多字段；group_concat；having；order by asc/desc；where 和 having 区别

--76.查询 score 表，求全部成绩平均分 avg (score)。
--不分组
SELECT avg (score) AS 成绩平均分
FROM score ;


--77.查询 score，求出最高分 max (score)、最低分 min (score)、总分 sum (score)、总记录 count (*)。
SELECT
    max (score) AS 最高分,
    min (score) AS 最低分,
    sum (score) AS 总分,
    count (*) AS 总记录(条数)
FROM score;

--78.统计 student 表一共有多少学生记录，使用 count (*)。
SELECT count (*) AS 学生记录个数
FROM student;


--79.统计 student 表 age 字段不为 null 的学生数量count(age)。
SELECT count(age) AS 有效年龄数量
FROM student
WHERE age IS NOT NULL;

--80.student 表按照 gno 班级编号分组，统计每个班级学生人数；输出 gno、学生人数。
SELECT gno,count(sno) as 学生人数
FROM student
GROUP BY gno;


--81.score 表按照 lno 课程编号分组，统计每门课平均分，输出 lno、平均分。
SELECT lno,AVG(score) AS 平均分
FROM score
GROUP BY lno;


--82.score 按照 gno、lno 两个字段分组，统计每个班级每一门课的平均分。
SELECT gno,lno,AVG(score) AS 每个班级每一门课平均分
FROM score
GROUP BY gno,lno;

--83.使用group_concat()，student 按 gno 分组，把同一个班级的学生姓名拼接成字符串。
SELECT group_concat(sname) AS 同班同学姓名
FROM student
GROUP BY gno;

--84.student 按 gno 分组，统计每个班级平均年龄，使用 having 筛选，只保留平均年龄大于 21 的分组。
SELECT gno,AVG(age) AS 每班平均年龄
FROM student
GROUP BY gno
HAVING AVG(age)>21;


--85.score 按 lno 课程分组，计算课程平均分，having 过滤只保留平均分大于 70 的分组。
SELECT lno,AVG(score) AS 每科平均分
FROM score
GROUP BY lno
HAVING AVG(score)>70;

--86.查询 score 全部成绩，按 score 分数降序排序。
SELECT sno,lno,gno,score
FROM score
ORDER BY score DESC;

--87.查询 score，先按 gno 升序，相同班级内部 score 分数降序排序。
SELECT sno,lno,gno,score
FROM score
ORDER BY gno ASC,score DESC;

--88.查询 student 学生，age 降序；年龄相同则 sname 姓名升序。
SELECT *
FROM student
ORDER BY age DESC,sname ASC;


--89.student 表 where 条件过滤 gno>285，再按 gno 分组统计每个班级学生数量，having 要求学生数量 >=1。
SELECT gno, COUNT(*) AS 学生数量

SELECT count(sno) AS 每班学生数量
FROM student
WHERE gno>285
GROUP BY gno
HAVING count(sno)>=1; 

#SELECT *
#FROM student
#WHERE gno>285;

--90.score 表按 lno 分组求每门课最高分，结果按照最高分降序排序。
-- 在分组，排序字段的必须加入查询字段中（包括聚合函数字段，不可使用普通字段）
-- 在分组后查询必须使用分组的字段，以及聚合函数
SELECT lno,MAX(score) AS 每门课最高分
FROM score
GROUP BY lno
ORDER BY MAX(score) DESC;

