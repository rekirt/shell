#!/bin/bash
#递归函数
#

# 阶乘函数
function factorial {
   if [ $1 -eq 1 ] ; then
      echo "1"
   else
      local temp=$[ $1 - 1 ]
      local result=`factorial $temp`
      echo "$[ $result * $1 ]" 
   fi 
}

read -p "Enter a value: " value
echo "the value you input is $value"
result=`factorial $value`
echo "the result of factorial is $result"

