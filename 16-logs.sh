#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript_logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

 VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo -e  "$2...$R failure $N"
        exit 1
    else
        echo -e  "$2...$R success $N"
    fi

 }

echo "script started and executed at: $TIMESTAMP" &>>$LOG_FILE_NAME

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATION $? "installing mysql"
else
    echo -e "mysql is already $Y installed $N"
fi 

dnf list installed git 

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATION $? "installing git"
else
    echo -e "git is already $Y installed $N"
fi