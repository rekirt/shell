#!/bin/bash
#
var1=100
until echo $var1
    [ $var1 -eq 0 ]
do
    echo "this is inside loop: $var1"
    var1=$[ $var1-25 ]
done

