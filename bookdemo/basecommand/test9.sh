#!/bin/bash
#多条命令组合在一块，有Red Hat中采用冒号":"来分割，Ubuntu中采用分号";"
var1=`echo " scale=4; 3.14 / 2" | bc`
echo the answer is $var1

