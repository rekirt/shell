#!/bin/bash
#
while [ -n "$1" ] ; do
  case "$1" in 
    -a) echo "Found -a option" ;;
    -b) param="$2"
        echo "Found -b option the parameter value is : $param"
        shift 2 ;;
    -c) echo "Found -c option" ;;
    --) shift
        break ;;
    *) echo "$1 is not a option" ;;
  esac
  shift
done

count=1
for param in $@ ; do
  echo "parameter #$count :$param"
  count=$[ $count +1 ]
done
