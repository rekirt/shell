#!/bin/bash
# using a function in a script
function func1 {
  echo "this is an example of function"
}
count=1
while [ $count -le 5 ] ; do
  func1
  count=$[ $count +1 ]
done
echo "this is the end of the loop"
func1
echo "now this is the end of the script"

