#!/bin/bash
#
if [ -d $HOME ] ; then
  echo "your HOME directory exists"
  cd $HOME
  ls -al
else 
  echo "there is a problem with your HOME directory"
fi
