#!/bin/bash
#
if [ -G test19.sh ] ; then
  echo "You are in the same group the file"
else
  echo "the file is not owned by your group"
fi
