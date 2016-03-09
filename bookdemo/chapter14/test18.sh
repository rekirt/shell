#!/bin/bash
#多个文件描述符
#从STDIN中写数据，从STDOUT中读数据
# 清除日志的常用方法
# cat /dev/null > 日志文件
exec 3> test18file1
exec 6> test18file2
exec 7> testfile

lsof -a -p $$ 





