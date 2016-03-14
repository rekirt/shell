#!/bin/bash
# using the return comand in a function
# 返回码必须小于256

function db1 {
  read -p "Enter a value :" value
  echo "doubling the value"
  return $[ $value * 2 ]
}

db1 
echo "the new value is $?"
