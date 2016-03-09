#!/bin/bash
# tee 命令的使用
# date | tee testfile 
# tee 命令会把STDIN中的数据一边输出到STDOUT一边输出到指定的文件


tempfile=test22file
echo "this is the start of the test " | tee $tempfile
echo "this is the second line of the test " | tee -a $tempfile
echo "this is the end of the test" | tee -a $tempfile




