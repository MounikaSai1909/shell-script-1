# delete old files more than 2 weeks old

# 1.decide which folder,check the folder exists or not
# 2. dont delete files ending with .java,.sh, .py ,delete only ending with .log 
# 3. find and delete the files which are more than 2 weeks old


#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ]
then
   echo -e "$G $SOURCE_DIRECTORY folder exists $N"
else
   echo -e "$R Please make sure $SOURCE_DIRECTORY folder exists $N"
   exit 1
fi 
##

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

#while IFS= read -r line (Ineternal Field Seperator )
#do
#statement to execute 
#done <<< input

while IFS= read -r line 
do
  echo "Deleting files : $line"
  rm -rf $line
done <<< $FILES

##
