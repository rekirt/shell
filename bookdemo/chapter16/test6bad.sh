#!/bin/bash
# 函数内部调用$1 $2 和脚本主体使用的$1和$2变量不同

function badfun1 {
  echo $[ $1 * $2 ]
}

if [ $# -eq 2 ] ; then
  value=`badfun1`
  echo "the result is $value"
else
  echo "Usage: badfun1 a b"
fi



