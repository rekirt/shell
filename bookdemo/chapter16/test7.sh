#!/bin/bash
function func7 {
  echo $[ $1 * $2 ]
}

#错误的写法

if [ $# -eq 2 ] ; then
  value=`func7`
  echo "the result is $value"
else
  echo "usage is : func7 a b"
fi


#正确写法
if [ $# -eq 2 ] ; then
  value=`func7 $1 $2`
  echo "the result is $value"
else
  echo "usage is : func7 a b"
fi


