#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then  
    echo "Error: you do not have access"
    exit 1
fi 

VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...failure"
        exit 1
    else
        echo "$2 is...success"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    VALIDATION $? "installing mysql"
else
    echo "mysql is already installed"
fi 

dnf list installed git 

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATION $? "installing git"
else 
    echo "git is already installed"
fi