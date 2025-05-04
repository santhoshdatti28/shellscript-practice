#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error: you do not have access"
    exit 1 
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "installing mysql is failed"
    exit 1 
else
    echo "installing mysql is success"
fi

dnf install git -y 

if [ $? -ne 0 ]
then
    echo "installing git is failed"
else
    echo "installing git is success"
fi
