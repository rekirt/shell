#!/bin/bash
#
if [ ./test19.sh -nt ./test18.sh ] ; then
  echo "the file test19.sh is newer than test18.sh"
else
  echo "the file test18.sh is newer than test19.sh"
fi
if [ ./test17.sh -ot ./test19.sh ] ; then
  echo "test17.sh is older than the test19.sh file" 
fi
