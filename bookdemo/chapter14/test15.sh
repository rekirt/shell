#!/bin/bash
# 0 文件输入符
# exec  0 < 文件
# 将输入重定向到某个文件，也就是输入的内容来源于文件

exec 6<&0
exec 0< testfile
count=1
while read line ; do
  echo "Line#$count:$line"
  count=$[ $count -1 ]
done
exec 0<&6

read -p "Are you done now?" answer

case $answer in 
  Y|y) echo "Goodbye";;
  N|n) echo "Sorry this is the end.";;
esac






