#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/home/centos/log_dir/$SCRIPT_NAME+$DATE.log

USERID=$(id -u)

if[ USERID -ne 0 ]
then    
    echo "Run with root access"
    exit 1
fi

VALIDATE(){

    if[ $1 -ne 0 ]
    then
        echo " $2 failed"

    else 
        echo "$2 is sucess"
    fi

}


yum install nginx -y &>>$LOGFILE
VALIDATE $? "Installing Nginx"

