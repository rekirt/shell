#!/bin/bash
#
testuser=baduser
if grep $testuser /etc/passwd ; then
  echo "the files for user $testuser are:"
  ls -al /home/$testuser/.b*
else
  echo "the user does not exist on the system"
fi
