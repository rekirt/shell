#!/bin/bash
#
var1=10
if (( $var1 ** 2 > 90 )) ; then
  (( var2 = $var1 ** 2 ))
  echo "the square of $var1 is $var2"
fi
