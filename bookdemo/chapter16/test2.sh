#!/bin/bash
# using a funcition locate in the middle of a script
count=1
echo "this line comes before the function definition"
function func1 {
  echo "this is a example of a function"
}

while [ $count -le 5 ] ; do
  func1
  count=$[ $count + 1 ]
done
  echo "this is the end of the loop"
func2
echo "now this is the end of the script"

function func2 {
  echo "this is an example of a function"

}
