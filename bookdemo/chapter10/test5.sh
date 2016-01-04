#!/bin/bash
#反引号(和波浪号一起的字符)扩起来的字符串可以做命令执行，好强大呀
testing=`date`
echo testing=$testing

today=`date +%y%m%d`
ls /usr/bin -al > log.$today

