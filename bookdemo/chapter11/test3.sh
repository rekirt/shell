#!/bin/bash
#
testuser=lc
if grep $testuser /etc/passwd ; then
  echo "the bash file for user $testuser are:"
  ls -a /home/$testuser/.b*
fi
