DROP SCHEMA IF EXISTS `studysql` ;
CREATE SCHEMA `studysql` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
use studysql;

create table `studysql`.`grade`(
  gno       INT NOT NULL,
  gname     VARCHAR(64) NOT NULL,
  tno  INT NULL,
  BeginDate DATE,
  PRIMARY KEY (`gno`));

CREATE TABLE `studysql`.`student` (
  `gno` INT NOT NULL,
  `sno` INT NOT NULL,
  `sname` VARCHAR(64) NOT NULL,
  `address` VARCHAR(512) NULL,
  `email` VARCHAR(128) NULL,
  `age` INT NULL,
  `telephone` VARCHAR(11) NULL,
  PRIMARY KEY (`gno`,`sno`));

create table `studysql`.`teacher` (
  tno       INT NOT NULL,
  tname     VARCHAR(64) NOT NULL,
  address  VARCHAR(512) NULL,
  email     VARCHAR(128) NULL,
  telephone VARCHAR(16) NULL,
  PRIMARY KEY (`tno`));

create table lesson(
  lno       INT NOT NULL,
  lname     VARCHAR(64) NOT NULL,
  ldesc     VARCHAR(512),
  PRIMARY KEY (`lno`)
);

create table score(
  gno       INT NOT NULL,
  sno       INT NOT NULL,
  lno       INT NOT NULL,
  score     INT default 0,
  foreign key(gno, sno) references student(gno, sno) on delete no action on update no action
);

create table schedule(
  ldate     DATE NOT NULL,
  gno       INT NOT NULL,
  lno       INT NOT NULL,
  tno       INT NOT NULL,
  clsroom   VARCHAR(128)
);

set sql_safe_updates = 0;

insert into student values(101,1,'吴丹','江西','sh2013010301@qq.com',floor(rand()*4) + 20,'18720412345');
insert into student values(102,1,'宋亚茹','河南省','sh2013010302@qq.com',floor(rand()*4) + 20,'15838312345');
insert into student values(103,1,'钱姣','江苏','sh2013010303@qq.com',floor(rand()*4) + 20,'18068712345');
insert into student values(101,2,'徐娟','安徽','sh2013010304@qq.com',floor(rand()*4) + 20,'15295112345');
insert into student values(102,2,'孙雪艳','河南','sh2013010305@qq.com',floor(rand()*4) + 20,'15937112345');
insert into student values(103,2,'王品','上海','sh2013010306@qq.com',floor(rand()*4) + 20,'15803812345');
insert into student values(101,3,'王文柯','河南','sh2013010307@qq.com',floor(rand()*4) + 20,'13248012345');
insert into student values(102,3,'周海兰','江西省','sh2013010308@qq.com',floor(rand()*4) + 20,'13386112345');
insert into student values(103,3,'胡红英','安徽','sh2013010309@qq.com',floor(rand()*4) + 20,'15949512345');
insert into student values(101,4,'张智森','上海市','sh2013010310@qq.com',floor(rand()*4) + 20,'');
insert into student values(102,4,'徐娴','江西','sh2013010311@qq.com',floor(rand()*4) + 20,'18607912345');
insert into student values(103,4,'邓萍','四川','sh2013010312@qq.com',floor(rand()*4) + 20,'13122712345');

insert into teacher values(1,'宋峰','云南北路59号六合大厦1510','songfeng@qq.com','');
insert into teacher values(2,'许爱国','云南北路59号六合大厦1511','xuag@qq.com','');
insert into teacher values(3,'陆怡颐','云南北路59号六合大厦1512','luyy@qq.com','');
insert into teacher values(4,'肖志斐','云南北路59号六合大厦1513','xiaozf@qq.com','');
insert into teacher values(5,'严晓婷','云南北路59号六合大厦1514','yanxt@qq.com','');
insert into teacher values(6,'陆小刚','云南北路59号六合大厦1515','luxg@qq.com','');
insert into teacher values(7,'蓝瑶琴','云南北路59号六合大厦1516','lanyq@qq.com','');
insert into teacher values(8,'宋宇琳','云南北路59号六合大厦1517','songyl@qq.com','');

insert into grade values(103,'第一百九十五期',7,'2019-01-01');
insert into grade values(102,'第一百九十四期',8,'2018-12-01');
insert into grade values(101,'第一百九十三期',null,'2018-11-01');

insert into lesson values(1,'测试基础','测试理论');
insert into lesson values(2,'Linux','环境部署');
insert into lesson values(3,'ORACLE','数据库应用');
insert into lesson values(4,'QTP','自动化测试');

insert into score select a.gno, a.sno, b.lno, floor(rand()*60)+39 from student a, lesson b;
delete from score where sno=2 and gno=102 and lno=4; 
insert into schedule values('2019-01-01',101,1,1,'第805教室');
insert into schedule values('2019-01-01',102,2,2,'第1405教室');
insert into schedule values('2019-01-01',103,3,3,'第1504教室');
insert into schedule values('2019-01-02',101,4,4,'第1505教室');
insert into schedule values('2019-01-02',102,1,5,'第805教室');
insert into schedule values('2019-01-02',103,2,6,'第1405教室');
insert into schedule values('2019-01-03',101,3,1,'第1504教室');
insert into schedule values('2019-01-03',102,4,2,'第1505教室');
insert into schedule values('2019-01-03',103,1,3,'第805教室');
insert into schedule values('2019-01-04',101,2,4,'第1405教室');
insert into schedule values('2019-01-04',102,3,5,'第1504教室');
insert into schedule values('2019-01-04',103,4,6,'第1505教室');
insert into schedule values('2019-01-05',101,1,1,'第805教室');
insert into schedule values('2019-01-05',102,2,2,'第1405教室');
insert into schedule values('2019-01-05',103,3,3,'第1504教室');
insert into schedule values('2019-01-06',101,4,4,'第1505教室');
insert into schedule values('2019-01-06',102,1,5,'第805教室');
insert into schedule values('2019-01-06',103,2,6,'第1405教室');
