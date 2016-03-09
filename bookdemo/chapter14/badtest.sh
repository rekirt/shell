#!/bin/bash
# 关闭文件描述符
# 
#
#

#输出重定向到文件test17file
exec 3>test17file
echo "This is a test line of data" >&3
#关闭文件描述符
exec 3>&-
echo "this won't work " >&3



