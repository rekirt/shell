#!/bin/bash
#
var1=`echo "scale=4;10/3" | bc`
echo "the test value is $var1"
if [ $var1 -gt 3 ] ; then
  echo "the result is larger than 3"
fi

# test 命令不支持浮点值
