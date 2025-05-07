#!/bin/bash

DISK_USGAE=$(df -hT | grep xfs)
DISK_THRESHOLD_VALUE=5
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print 6NF}' | cut -d "%" -f1)
done <<< $DISK_USAGE