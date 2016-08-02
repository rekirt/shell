show databases;

#修改密码
set password=password('root');

#创建测试数据库
create database firstdb;
#数据库授权
grant all on firstdb.* to root@localhost identified by 'root';

#切换数据库
use firstdb;

#创建表
create table sales_rep(
employee_number int,
surname varchar(40),
first_name varchar(30),
commission tinyint
);

create table sales_representative(
employee_no int,
surname varchar(40),
first_name varchar(30),
commission tinyint
);

#查看当前数据库中的表
show tables;
#查看表结构
describe sales_rep;

#向表中插入数据
insert into sales_rep(employee_number,surname,first_name,commission) values(1,"Rive","Sol",10);
insert into sales_rep(employee_number,surname,first_name,commission) values(2,"Gordimer","Charlene",10);
insert into sales_rep(employee_number,surname,first_name,commission) values(3,"Serote","Mike",10);

insert into sales_rep values(4,"test1","test2",15);

insert into sales_rep(employee_number,surname,first_name,commission) values(1,"Rive","Sol",10),(3,"Serote","Mike",10),(3,"Serote","Mike",10);
#从文件导入数据到表中,有些版本不支持
load data local infile "/home/lc/workspace/shell/mysql/data" into table sqles_rep;

#查询数据
select commission from sales_rep where surname='Gordimer';

select commission,employee_number from sales_rep where surname='Gordimer';

select * from sales_rep where commission>10 or surname='Rive' and first_name='Sol';

select * from sales_rep where surname='Rive' and first_name='Sol' or commission>10;
select * from sales_rep where surname='Rive' and (first_name='Sol' or commission>10);


#like和%

select * from sales_rep where surname='Serote' and first_name='Mike';
select * from sales_rep where surname like 'Sero%';
select * from sales_rep where surname like '%e%';
select * from sales_rep where surname like '%e%e';

insert into sales_rep values(5,'Moongane',10);
insert into sales_rep values(6,'Mike',12);

#分类
select * from sales_rep order by surname;
select * from sales_rep order by surname,first_name;

select * from sales_rep order by commission desc,surname asc,first_name asc;

#限制结果数量
select first_name,surname,commission from sales_rep order by commission desc;

select first_name,surname,commission from sales_rep order by commission desc limit 2,2;

#返回最大值
select max(commission) from sales_rep;

#去重
select surname from sales_rep order by surname;
select distinct surname from sales_rep order by surname;

#计数
select count(*) from sales_rep;

select count(distinct surname) from sales_rep;

select avg(commission) from sales_rep;

select min(commission) from sales_rep;

select sum(commission) from sales_rep;

select 1+1;

select first_name,surname,commission+2 from sales_rep;

#删除记录
#MySql运行在safe-updates模式下，该模式会导致非主键条件下无法执行update或者delete命令
#执行命令SET SQL_SAFE_UPDATES = 0;修改下数据库模式
SET SQL_SAFE_UPDATES = 0;

delete from sales_rep where employee_number=5;

update sales_rep set commission = 50 where employee_number=1;

#删除表或数据库
create table commission(id int);
drop table commission;
create database shortlived;
drop database shortlived;

#修改表结构
alter table sales_rep add date_joined date;
alter table sales_rep add year_born year;
alter table sales_rep change year_born birthday date;
alter table sales_rep modify birthday birthday_date date;
#删除列
alter table  sales_rep add enhancement_value int;
describe sales_rep;
alter table sales_rep drop enhancement_value;

#重命名表
alter table sales_rep rename cash_flow_specialist;
show tables;
alter table cash_flow_specialist rename sales_rep;

#日期函数
select date_joined,birthday from sales_rep;
update sales_rep set date_joined = '2001-04-04',birthday='1999-04-04' where employee_number=4;
update sales_rep set date_joined = '2001-03-03',birthday='1999-03-03' where employee_number=3;
update sales_rep set date_joined = '2001-02-02',birthday='1999-02-02' where employee_number=2;
update sales_rep set date_joined = '2001-01-01',birthday='1999-01-01' where employee_number=1;

select date_format(date_joined,'%m/%d/%Y') from sales_rep where employee_number=1;
select date_format(date_joined,'%W %M %a %Y') from sales_rep where employee_number=1;
select date_format(date_joined,'%a %D %b %Y') from sales_rep where employee_number=1;

select now(),current_date(),current_time(),current_timestamp(),current_user();

select year(birthday) from sales_rep;
select month(birthday),dayofmonth(birthday) from sales_rep;

#别名
select concat(first_name,' ',surname) as 'name',month(birthday) as 'month',dayofmonth(birthday) as 'day' from sales_rep order by month;
select dayofmonth(date_joined) from sales_rep where employee_number=1;

#多表查询
create table customer(
id int ,
first_name varchar(30),
surname varchar(40)
);

create table sales(
code int,
sales_rep int,
customer int,
value int
);


insert into customer values(1,'Yvonne','Clegg'),(2,'Johnny','Chaka-Chaka'),(3,'Winston','Powers'),(4,'Patricia','Mankunku');
insert into sales values(1,1,1,2000),(2,4,3,250),(3,2,3,500),(4,1,4,450),(5,3,1,3800),(6,1,2,500);

select sales_rep,customer,value,first_name,surname from sales,sales_rep where code=1 and sales_rep.employee_number=sales.sales_rep;
select code,customer,value from sales_rep,sales where first_name='Sol' and surname='Rive' and sales.sales_rep = sales_rep.employee_number;

select code customer,value from sales_rep,sales where first_name='Sol' and surname='Rive' and sales_rep=employee_number;
select code customer,value from sales_rep,sales where first_name='Sol' and surname='Rive' and sales.sales_rep=sales_rep.employee_number;
describe sales;
alter table sales change sales_rep employee_number int;
select code customer,value from sales_rep,sales where first_name='Sol' and surname='Rive' and sales.employee_number=sales_rep.employee_number;

alter table sales change employee_number sales_rep int;

select year(now()) - year(birthday) from sales_rep;
select year(now()) > year(birthday) from sales_rep where employee_number=1;
select right(current_date(),5),right(birthday,5) from sales_rep;
select surname,first_name,(year(current_date()))-year(birthday)-(right(current_date(),5)<right(birthday,5)) as age from sales_rep;
select sum(value) from sales;
select sales_rep,sum(value) from sales group by sales_rep;
select sales_rep,sum(value) as sum from sales group by sales_rep order by sum desc;
select sales_rep,count(*) as count from sales group by sales_rep order by count limit 1;
select first_name,surname,sales_rep,count(*) as count from sales,sales_rep where sales_rep=employee_number group by sales_rep,first_name,surname order by count limit 1;



















