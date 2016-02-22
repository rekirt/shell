#!/bin/bash
# 链接到mysql
MYSQL=`which mysql`
$MYSQL test -u test <<EOF
show tables;
select * from employees where salary > 40000;
EOF
