#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD_VALUE=5
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    echo "usage: $USAGE"
done <<< $DISK_USAGE