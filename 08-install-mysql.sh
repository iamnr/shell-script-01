#!/bin/bash

USERID=$(id -u)

if [ USERID -ne 0 ]
then
    echo "Run with root access"
    exit 1
fi 

yum install mysql -y

if [ $? -ne 0 ]
then    
    echo "Failure"
else
    echo :Sucess"
fi 
