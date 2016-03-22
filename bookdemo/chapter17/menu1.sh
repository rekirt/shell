#!/bin/bash
. ./funcs.sh

function menu {
clear
echo
echo -e "\t\t Sys Admin Menu \n"
echo -e "\t1. Display disk space"
echo -e "\t2. Display logged on users"
echo -e "\t3. Display memory usage"
echo -e "\t0. Exit menu \n"
echo -en "Enter option:"
read -n 1 option
}
#菜单1
while [ 1 ] ; do
  menu
  case $option in
  0)
    break;;
  1)
    diskspace;;
  2)
    whoseon;;
  3)
    memusage;;
  *)
   clear
   echo "Sorry,wrong selection";;
  esac
  echo -en "any key to continue"
  read -n 1 line
done
clear

