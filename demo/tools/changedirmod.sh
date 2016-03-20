#!/bin/bash
# 遍历当前目录下的所有文件，如果该文件是目录则继续遍历
# 对于是目录的文件修改属性为755

function foreachdir {
  dirname=$1
  if [ -d $dirname ] ; then
    for subdir in $dirname/* ; do
      if [ -d $subdir ] ; then
        echo $subdir
        chmod 755 $subdir
        foreachdir $subdir
      fi
    done
  else 
    echo "非目录"
  fi
}

#echo "遍历目录为 $1"
#echo "3秒后开始执行"
#for ((i=3; i>0; i--  )){
#  sleep 1s
#  echo $i
#}

function testecho {
  echo "hello"
  echo $1,$2
}


echo "开始"
name=$1
if [[ "x$name" == 'x.' ]] ; then
    echo "."
else
    echo "$1"
fi
#testecho ~/workspace/ $name

#foreachdir ~/workspace/

echo "结束"


