#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/home/ec2-user/shell-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo -e "$R USAGE: $N sh 19-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(OPTIONAL)>"
    exit 1
}


mkdir -p /home/ec2-user/shell-logs

if [ $# -lt 2 ]
then 
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R SOURCE DIR does exist..please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then 
    echo -e "$R DEST DIR does not exist..please check $N"
    exit 1
fi

FILES=$(find /home/ec2-user/app-logs -name "*.log" -mtime +$DAYS)



if [ -n $FILES ]
then
    echo "files to be: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f $ZIP_FILE ]
    then
        echo -e "Successfully created zip file for files older than $DAYS"
        while read -r filepath
        do
            echo "deleting file: $filepath"
            rm -rf $filepath
            echo "deleted file: $filepath
        done <<< $FILES
    else
        echo -e "$R failed to create zip file $N"
        exit 1
    fi
else
    echo "no files found to zip older than $DAYS"
fi

