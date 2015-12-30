#!/bin/bash
var1=100
var2=45
var3=`echo "scale=4; $var1/$var2" | bc`
echo the answer for this is $var3
