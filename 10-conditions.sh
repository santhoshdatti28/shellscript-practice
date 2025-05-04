#!/bin/bash

NUM1=$1
NUM2=$2 

if [ $NUM1 -eq $NUM2 ]
then   
    echo "given numbers are equal"
else
    echo "given numbers are not equal"
fi