#!/bin/bash
# testing the exit status of a function
func1() {
  echo "trying to display a non-existent file"
  ls -a badfds
}
echo "testing the function:"
func1
echo "the exit status $?"


#函数的默认函数是函数最后一条命令的执行的退出码
