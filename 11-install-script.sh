#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you do not have access"
    exit 1
fi

dnf install mysql -y

