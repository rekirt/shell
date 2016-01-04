#!/bin/bash
# nested for loop

for (( a=1;a<=3;a++ ))
do
    echo "Outer loop a = $a"
    for(( b=1;b<=3;b++ ))
    do
        echo "		Inside loop b = $b"
    done
done

