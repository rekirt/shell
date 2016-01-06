#!/bin/bash
#
while [ -n "$1" ] ; do
  case $1 in 
    -a) echo "Found -a option" ;;
    -b) echo "Found -b option" ;;
    -c) echo "Found -c option" ;;
    --) shift
        break ;;
    *) echo "$1 is not a option" ;;
  esac
  shift
done

count=1
for param in $@ ; do
  echo " parameter #$count:$param "
  count=$[ $count + 1 ]
done
