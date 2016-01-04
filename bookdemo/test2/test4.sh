#!/bin/bash
#testing the else section
testuser=lcx
if grep $testuser /etc/passwd
then
    echo the files for user $testuser are:
    ls -a /home/$testuser/.b*
else
    echo "the user name $testuser does not exist on this system"
fi
