#!/bin/bash
. ./funcs.sh


PS3="Enter option: "
select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"
do
  case $option in
    "Exit program") break;;
    "Display disk space")diskspace;;
    "Display logged on users")whoseon;;
    "Display memory usage")memusage;;
    *)
      clear
      echo "sorry wrong selection" ;;
  esac

done



