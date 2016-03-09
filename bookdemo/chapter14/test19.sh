#!/bin/bash
# mktemp filename.XXXXXX 创建临时文件".XXXXXX"会被系统替换为随机字符，确保文件名唯一
# 

tempfile=`mktemp test19.XXXXXX`
exec 3>$tempfile
echo "This script writes to temp file $tempfile"
echo "this is the first line " >&3
echo "this is the second line ." >&3
echo "this is the last line ." >&3
echo 3>&-
echo "Done creating temp file. the contents are:"
cat $tempfile
rm -f $tempfile 2> /dev/null


