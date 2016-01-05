#!/bin/bash
#
if [ -e $HOME ] ; then
  echo "the object is exist"
  if [ -f $HOME ] ; then
    echo "the object is a file"
  else
    echo "no it is not a file"
    if [ -f $HOME/.bash_rc ] ; then
      echo "but this is a file"
    fi
  fi
else
  echo "the object is not exist"
fi
