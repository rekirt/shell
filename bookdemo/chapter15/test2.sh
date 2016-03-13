#!/bin/bash

trap "echo Exit program" EXIT

count=1
while [ $count -le 5 ] ; do
  echo "Loop#$count"
  sleep 3
  count=$[ $count+1 ]
done

