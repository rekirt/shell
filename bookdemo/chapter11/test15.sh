#!/bin/bash
#
file=test15
touch $file
if [ -s $file ] ; then
  echo "the $file file exists and has data in it"
else
  echo "the $file existss and is empty"
fi
date > $file
if [ -s $file ] ; then
  echo "the $file file has data in it"
else
  echo "the $file file is still empty"
fi
