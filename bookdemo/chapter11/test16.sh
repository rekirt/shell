#!/bin/bash
#
logfile=$HOME/logfile
touch $logfile
chmod u-w $logfile
now=`date +%Y%m%d-%H%M`
if [ -w $logfile ] ; then
  echo "the program ran at : $now" > $logfile
  echo "the first attempt succeded"
else
  echo "the first attempt failed"
fi

chmod u+w $logfile
if [ -w $logfile ] ; then
  echo "the program ran at : $now" > $logfile
  echo "the second attempt succeded"
else
  echo "the second attempt failed"
fi
