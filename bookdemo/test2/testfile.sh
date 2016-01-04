#!/bin/bash
if [ -d ../test2 ]; then
  for i in ../test2/*sh; do
    if [ -r $i ]; then
      . $i
      echo $i
    fi
  done
  unset i
fi
