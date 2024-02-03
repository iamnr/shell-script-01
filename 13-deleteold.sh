#!/bin/bash
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGDIR=/home/centos/log_dir/
LOGFILE=$LOGDIR/$SCRIPT_NAME+$DATE.log

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Run with root access"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGDIR -name "*.log" type -f -mtime +14)

while read line
do
    echo "Deleting $line" &>>$LOGFILE
    rm -rf $LINE
done <<< $FILES_TO_DELETE
