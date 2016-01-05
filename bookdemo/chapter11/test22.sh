#!/bin/bash
#
if [ -d $HOME ] && [ -f $/HOME/testing ] ; then
  echo "the file exist and you can wirte it"
else
  echo "i cannot write to the file"
fi
