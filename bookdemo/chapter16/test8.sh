#!/bin/bash
# 全局变量
# 局部变量 
# local 全局变量可以把全局变量私有化，转换为局部变量

function db1 {
  value=$[ $value * 2 ]
}

read -p "Enter a value:" value

db1

echo "the new value is $value" 


