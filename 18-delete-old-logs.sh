#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript_logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
SOURCE_DIR="/home/ec2-user/app-logs"
FILES_TO_DELETE=$(find /home/ec2-user/app-logs -name "*.log" -mtime +14)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Error: you do nothave access"
        exit 1
    fi
}

CHECK_ROOT

mkdir -p /var/log/shellscript_logs

echo "script started and executed at: $TIMESTAMP" &>>$LOG_FILE_NAME

echo "files to delete: $FILES_TO_DELETE"

while read -r file
do
    echo "deleting files are: $file"
done <<<  $FILES_TO_DELETE