#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

USERID=$(id -u)

LOGS_FOLDER= "/var/log/shellscript_logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP"

# VALIDATION(){

# }

echo "script started and executed at: $TIMESTAMP" &>>$LOG_FILE_NAME