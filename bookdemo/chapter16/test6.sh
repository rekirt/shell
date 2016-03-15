#!/bin/bash
#在函数中使用变量
# $# 变量存放了参数个数，
# $0 脚本的名称
# $1 第一个参数，$x 第x个参数


function add {
  if [ $# -eq 0 ] || [ $# -gt 2 ] ; then
    echo "-1"
  elif [ $# -eq 1 ] ; then
    echo $[ $1 + $1 ]
  else
    echo $[ $1 + $2 ]
  fi
}


echo -n  " Adding 10 and 15:"
value=`add 10 15`
echo $value
echo 
echo -n "Let's try adding just one number:"
value=`add 10`
echo $value
echo 
echo -n "Now trying adding no numbers:"
value=`add`
echo $value
echo
echo -n "Finally try adding three numbers:"
value=`add 10 15 20`
echo $value
echo
echo "this is the end of the program"





