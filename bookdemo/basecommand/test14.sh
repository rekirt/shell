#!/bin/bash
#test exit status
# status code = 结果除于256的余数
var1=10
var2=30
var3=$[ $var1 * $var2 ]
echo the result is $var3
exit $var3
