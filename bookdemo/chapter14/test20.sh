#!/bin/bash
# 使用mktemp 创建临时文件，-t 参数返回临时文件的路径
#


tempfile=`mktemp -t tmp.XXXXXX`
echo "This is a test file." >$tempfile
echo "this is the second line of the test." >>$tempfile

echo "the temp file is located at : $tempfile"

cat $tempfile

rm -f $tempfile





