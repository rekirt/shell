#!/bin/bash
#
testuser=baduser
if [ $testuser = $USER ] ; then
  echo "welcome $testuser"
else
  echo "this is not $testuser"
fi
