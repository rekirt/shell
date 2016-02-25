#!/bin/bash
DATE=`date +%y%m%d`
FILE=archive$DATE.tar.gz

CONFIG_FILE=./file_to_backup
DESTINATION=./$FILE

if [ -f $CONFIG_FILE ] ; then
  echo "file exists"
else
  echo 
  echo "$CONFIG_FILE does not exist"
  echo "Backup not completed due to missing Configuration file"
  echo 
  exit
fi

# Build the names of all the files to backup 

FILE_NO=1
exec < $CONFIG_FILE
read FILE_NAME
while [ $? -eq 0 ] ; do
  if [ -f $FILE_NAME -o -d $FILE_NAME ] ; then
    FILE_LIST="$FILE_LIST $FILE_NAME"
  else
    echo
    echo "$FILE_NAME does not exist"
    echo "Obviusly. I will not include it in this archive"
    echo "it is listed on line $FILE_NO of the config file."
    echo "counting to build archive list..."
    echo
  fi
  FILE_NO=$[$FILE_NO + 1]
  read FILE_NAME
done
echo "creating archive file"
tar -zcvf $DESTINATION $FILE_LIST 2> /dev/null



