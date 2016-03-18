#!/bin/bash
# 函数返回数组

function alterarray {
  local length
  local newarray
  local oldarray
  local i
  newarray=(`echo "$@"`)
  oldarray=(`echo "$@"`)
  length=$[ $# - 1 ] 
  for ((i = 0; i <= length; i++ )) {
    newarray[$i]=$[ ${oldarray[$i]} * 2] 
  }
  echo ${newarray[*]}
}

myarray=(1 2 3 4 5)
echo "the original array is ${myarray[*]}"
#result=`alterarray ${myarray[*]}`
#echo "the result array is  ${result[*]}"

echo "${myarray[3]}"
echo "$[ ${myarray[0]} * ${myarray[1]} ]"


