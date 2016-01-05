#!/bin/bash
#
if [ -o /etc/passwd ] ; then
  echo "your are the ower of /etc/passwd file"
else
  echo "your are not the ower of /etc/passwd file"
fi

if [ -O test16.sh ] ; then
  echo " but your are the ower of test16.sh file "
else
  echo "your are not the ower of test16.sh file"
fi


