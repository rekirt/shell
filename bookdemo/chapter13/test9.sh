#!/bin/bash
#
if [ $# -ne 2 ] ; then
  echo "Usage: test9 a b"
else
  total=$[ $1 +$2 ]
  echo total is $total
fi

