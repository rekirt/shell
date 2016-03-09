#!/bin/bash
exec 2>testerror
echo "this is the start of the script"
echo "now redirecting all output to another location"

echo 1>testout

echo "this output should go to the testout file" 
echo "but this should to to the testerror file " >&2








