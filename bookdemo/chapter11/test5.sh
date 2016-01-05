#!/bin/bash
#
var1=10
var2=11
if [ $var1 -gt 5 ] ; then
  echo "$var1  is greater than 5"
fi

if [ $var1 -eq $var2 ] ; then
  echo "the values are equal"
else
  echo "the values are different"
fi
