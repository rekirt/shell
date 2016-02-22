#!/bin/bash
# 链接到mysql
MYSQL=`which mysql`
if [ $# -ne 4 ] ; then
    echo "usage: test4 empid lastname firstname salary"
else
    statement="insert into employees values ($1,'$2','$3',$4)"
    $MYSQL test -u test << EOF
    $statement
EOF
    if [ $? -eq 0 ] ; then
         echo "Data successfully added"
    else
        echo "Problem adding data" 
    fi
fi

