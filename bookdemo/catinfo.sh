#!/bin/bash
#show info
for file in ./basecommand/*
do
    echo "$file"
    echo '--------------'
    cat "$file"
    echo '--------------'
    sleep 5
done

