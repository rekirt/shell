#!/bin/bash
#
filename="test"
extname=".sh"
for (( var1=1;var1<=26;var1++ )) ; do
  testfile=${filename}${var1}${extname}
  echo $testfile
  touch $testfile
  chmod 775 $testfile
done
