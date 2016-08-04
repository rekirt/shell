show databases;
use firstdb;


#数据库和表名区分大小写,列名不区分大小写
create table Test5(first_Name char(20));
show tables;
show databases;
drop database FirstDb;
drop table Test5;
create database FirstDb;


#数据类型，数字，字符串，日期

#数字
create table test1(id tinyint zerofill);
insert into test1 values(3);
insert into test1 values(-10);
insert into test1 values(256);
select * from test1;

create table test2(id tinyint(10));
insert into test2(id) values(100000000);
select * from test2;

create table test3(id int(1));
insert into test3(id) values(42432432);
select id from test3;

create table test4(id int(3) zerofill,id2 int zerofill);
insert into test4(id,id2) values(22,33);
select id,id2 from test4;

#字符
create table test5(first_name char(10));
insert into test5(first_name) values('Hello');
select first_name from test5 where first_name='hello';
alter table test5 change first_name first_name char(10) binary;
select first_name from test5 where first_name='hello';

#枚举值
create table test6(islawyer enum('true','false'));
insert into test6(islawyer) values('true');
insert into test6(islawyer) values('false');
insert into test6(islawyer) values('hahah');
select * from test6 where islawyer=2;#1==true,2==false
insert into test6 values(2);
select * from test6 where 2=2;
select * from test6 order by islawyer asc;

#集合
create table test7(fruit set('apple','banana','orange','mango','pear'));
insert into test7(fruit) values('apple');
insert into test7(fruit) values('pear');
insert into test7(fruit) values('something');
insert into test7(fruit) values('apple,pear,orange');
select * from test7;
select * from test7 order by fruit;

#日期，时间
create table test8(ts datetime);
insert into test8 values('1991-02-03 10:10:11');
insert into test8 values('1991,10,20,20:22:22');
insert into test8 values('1000:20:11:23:23:33');

select * from test8;
select max(value) from sales;
select * from customer;

#表类型
#alter table test8 type=myisam;

#ubuntu中mysql数据文件的位置/var/lib/mysql

#表合并
create table sales_rep1(
id int auto_increment primary key,
employee_number int(11),
surname varchar(40),
first_name varchar(40),
commission tinyint(4),
date_joined date,
birthday date
);

create table sales_rep2(
id int auto_increment primary key,
employee_number int(11),
surname varchar(40),
first_name varchar(40),
commission tinyint(4),
date_joined date,
birthday date
);

create table sales_rep1_2(
id int auto_increment primary key,
employee_number int(11),
surname varchar(40),
first_name varchar(40),
commission tinyint(4),
date_joined date,
birthday date
)union(sales_rep1,sales_rep2);

insert into sales_rep1 values(0,1,'Tehwete','Paul',15,'1999-01-03','1970-03-04');
insert into sales_rep2 values(1,2,'Grobler','Peggy-Sue',12,'2001-01-03','1937-03-04');

select * from sales_rep1_2;















