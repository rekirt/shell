#!/bin/bash
# 关闭文件描述符

exec 3> test17file
echo "This is a test line of data" >&3

exec 3>&-

cat test17file

exec 3> test17file

echo "this'll be bad" >&3













