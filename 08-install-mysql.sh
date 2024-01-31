#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Run script with root access"
    exit 1
fi 

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Instalation if mysql is in erro"
    exit 1
else
    echo "Sucess"
fi 
