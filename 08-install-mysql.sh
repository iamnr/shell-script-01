#!bin/bash

USERID = $(id -u)

if [ USERID -ne 0 ]
then
    echo "Run script with root access"
    exit 1
fi 
