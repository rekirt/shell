#!/bin/bash
#
if [ -e $HOME ] ; then
  echo "OK on the directory now to check the file"
  if [ -e $HOME/testing ] ; then
    echo "Appending date to existing file"
    date >> $HOME/testing
  else
    echo "Creating new file"
    date > $HOME/testing 
  fi
else
   echo "there is no directory"
fi
