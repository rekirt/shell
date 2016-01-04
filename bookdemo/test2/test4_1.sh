#!/bin/bash
# testing elif
if js;then
    echo "date worked"
elif ls -al /home 
then
    echo "ls -al worked"
fi

