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









