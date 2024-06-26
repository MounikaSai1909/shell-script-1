#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r line 
do
    USAGE=$(echo $line | awk -F " " '{print $6}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $DISK_THRESHOLD, Current Usage : $USAGE \n"

    fi
done <<< "$DISK_USAGE"

echo -e "MESSAGE : $MESSAGE"

# echo "body" | mail -s "subject" to-address 

echo "$MESSAGE" | mail -s "Disk Usage Alert" puttiswamy123@gmail.com