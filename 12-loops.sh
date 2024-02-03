#!/bin/bash
DATE=$(date +%F:%h:%m)
SCRIPT_NAME=$0
LOGFILE=/home/centos/log_dir/$SCRIPT_NAME+$DATE.log

USERID=$(id -u)

if [ $USERID -ne 0 ]
then    
    echo "Run with root access"
    exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo " $2 failed"

    else 
        echo "$2 is sucess"
    fi
}


for i in $@
do
    yum list installed $i &>>$LOGFILE

    if [ $? -ne 0 ]
    then    
        echo "$i is not installed ,lets install"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo "$i is already installed"
    fi
done

