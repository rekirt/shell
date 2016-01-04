#!/bin/bash
#
var1=0
while echo "while iteration : $var1"
    [ $var1 -lt 15 ] ; do
  if [ $var1 -gt 5 ] && [ $var1 -lt 10 ] ; then
    continue
  fi
  echo " 	Inside interation number: $var1"
  var1=$[ $var1 + 1 ]
done

# continue 后面的语句不会被执行，当var1=6时进入死循环
