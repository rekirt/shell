#!/bin/bash
#
while getopts :ab:cd opt ; do
  case $opt in 
    a) echo "Found the -a option" ;;
    b) echo "Found the -b option width value $OPTARG" ;;
    c) echo "Found the -c option" ;;
    d) echo "Found the -d option" ;;
    *) echo "Unkown option : $opt" ;;
  esac
done
shift $[ $OPTIND -1 ]
count=1
for param in $@ ; do
  echo "parameter $count :$param"
  count=$[ $count +1 ]
done

