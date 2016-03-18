#!/bin/bash
#  $@ 所有命令行参数列表
#  $# 参数列表长度
#  $0 脚本名称
#  $1 参数列表中第一个参数

function testit {
    echo "$@"
    echo "$#"
    echo "$0"
    echo "$1"
    echo "$2"
    local newarray
    newarray=`echo "$@"`
    echo "the newarray is ${myarray[*]}"
}

myarray=(1 2 3 4 5)
echo "the original array is ${myarray[*]}"
testit ${myarray[*]}

