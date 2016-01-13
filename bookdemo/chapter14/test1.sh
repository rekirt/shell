#!/bin/bash
# 测试重定向标准输入0，标准输出1，标准错误2

#将输出重定向到test2
ls -al test2 1> test2
#将错误输出重定向到test3
ls -al badfile 2> test3
#将输出重定向和错误重定向到不同文件
ls -al test2 badfile 1>test4 2> test5
#将　输出重定向和错误重定向输出到一个文件
ls -al test2 badfile $> test6

