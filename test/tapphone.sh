#!/bin/bash
#模拟手机点击事件
for (( i=1;i<100;i++ ))
do
    echo "the count of tap: $i"
    adb shell input tap 500 900
done








