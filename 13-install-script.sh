#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: you do not have access"
    exit 1 
fi 

dnf list installed httpd

if [ $? -ne 0 ]
then
    dnf install httpd -y
    if [ $? -ne 0 ]
    then
        echo "installing httpd is failed"
        exit 1
    else
        echo "installing httpd is success"
    fi
else
    echo "httpd is already installed"
fi

