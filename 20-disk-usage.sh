#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD_VALUE=5
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -gt $DISK_THRESHOLD_VALUE ]
    then
        MSG+="High Disk usage on partition: $PARTITION Usage is: $USAGE \n " 
    fi
done <<< $DISK_USAGE

echo "$MSG"