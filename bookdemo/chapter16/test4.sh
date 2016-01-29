#!/bin/bash
# testing teh exit status of a function
# $?可以获取上一个命令执行完的结束码
func1() {
  echo "trying to display a non-existent file"
  ls -l badafile
}

echo "testing the function:"
echo "the up command exit code:$?"
func1
echo "the exist status is :$?"

