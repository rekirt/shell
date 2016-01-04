#!/bin/bash
#redirecting to a file
for file in /home/lc/Desktop/*
  do
    if [ -d "$file" ] 
    then
        echo "$file is a directory"
    else
        echo "$file is a file"
    fi
  done > test23.txt
