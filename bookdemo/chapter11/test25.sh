#!/bin/bash
#
if [ $USER = "lc" ] ; then
  echo "welcome $USER"
  echo "please enjoy your visit"
elif [ $USER = barbara ] ; then
  echo "welcome $USER"
  echo
elif [ $USER = testing ] ; then
  echo "welcome $USER"
  echo ""
elif [ $USER = jessica ] ; then
  echo "welcome $USER"
  echo ""
else
  echo "Sorry , you are not allowed here"
fi
