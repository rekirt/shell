#!/bin/bash
exec 3>>test13out

echo "this should dislplay on the monitor"
echo "and this hould be stored in the file" >&3
echo "Then this should be back on the monitor"
echo "this should be appended in the file" >&3
