#!/bin/bash
#testing parameters before use
if [ -n "$1" ];then
    echo Hello $1 glad to meet you 
else
    echo "Sorry Access Deny"
fi
