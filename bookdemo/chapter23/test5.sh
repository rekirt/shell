#!/bin/bash
# 链接到mysql
MYSQL=`which mysql`

dbs=`$MYSQL test -u test -Bse 'show databases'`
for db in $dbs ; do
  echo $db
done




