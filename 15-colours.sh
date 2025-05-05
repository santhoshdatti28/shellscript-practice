#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m" 
N="\e[0m"

USERID=$(id -u )

if [ $USERID -ne 0 ]
then 
    echo "Error: you do not have sudo access"
    exit 1 
fi 

VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is....$R failed $N"
        exit 1
    else
        echo -e  "$2 is...$G success $N"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y 
    VALIDATION $? "installing mysql"
fi 

dnf list installed git

if [ $? -ne 0 ]
then 
    dnf install git -y 
    VALIDATION $? "installing git"
else
    echo "git is already...$Y installed $N"
fi