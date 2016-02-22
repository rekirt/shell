#!/bin/bash
# 链接到mysql
MYSQL=`which mysql`
$MYSQL test -u test -X -e `select * from employees where empid = 1`




