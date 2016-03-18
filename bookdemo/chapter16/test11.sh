#!/bin/bash

function sumarray {
  local sum=0
  local newarray
  newarray=(`echo "$@"`)
  for value in ${newarray[*]} ; do
    sum=$[ $value + $sum ]
  done
  echo $sum
}

myarray=(1 2 3 4 5)
echo "the original array is :${myarray[*]}"
arg1=`echo ${myarray[*]}`
result=`sumarray $arg1`
echo "the result is $result"

