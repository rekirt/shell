#!/bin/bash
# testing using a duplicate function name

function func1 {
  echo "This is the first definaition of the function name"
}

func1
function func1 {
  echo "This is a repaet of the same function name"
}

func1
echo "this is the end of the script"

