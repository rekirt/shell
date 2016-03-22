#!/bin/bash
function diskspace {
  clear
  df -h
}
function whoseon {
  clear
  who
}

function memusage {
  clear
  cat /proc/meminfo
}

