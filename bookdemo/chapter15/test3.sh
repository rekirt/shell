#!/bin/bash

trap "program exit" EXIT

count=1

while [ $count -le 5 ] ; do
  echo "Loop#$count"
  sleep 2
  count=$[ $count +1 ]
done

trap - EXIT

echo "i remove the trap command"


