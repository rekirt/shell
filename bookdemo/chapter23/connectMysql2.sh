#!/bin/bash
# 链接到mysql
MYSQL=`which mysql`
$MYSQL test -u test -e 'select * from employees'
