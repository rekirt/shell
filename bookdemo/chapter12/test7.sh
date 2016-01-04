#!/bin/bash
#
for file in ~/.d* ~/workspace/shell
do
    if [ -d "$file" ];then
        echo "$file is a directory"
    elif [ -f "$file" ];then
        echo "$file is a file"
    else 
        echo "file does not exits"
    fi
done
