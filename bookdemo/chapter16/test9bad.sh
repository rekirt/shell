#!/bin/bash
# 向函数传递数组


function testit {
  echo "the parameters are :$@"
  thisarray=$1
  echo "the received array is ${thisarray[*]}"

}


myarray=(1 2 3 4 5)
echo "the original array is :${myarray[*]}"

testit $myarray




