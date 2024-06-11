#!/bin/bash

Num=$1

if [ $Num -gt 10 ]
then 
     echo " entered number $Num is greater then 10"
else 
     echo "entered number  $Num is less than 10"
fi

# -gt, -lt, -eq , -ge, -le 