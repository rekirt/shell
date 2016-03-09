#!/bin/bash
# 输入输出文件描述符
# 0 标准输入描述符
# 1 标准输出描述符
# 2 标准错误输出描述符
# 3 读取输入和写入输出描述符
# 
#

exec 3<> testfile

read line <&3

echo "Read: $line"

echo "This is a test line" >&3






