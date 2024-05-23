#!/bin/bash

# log redirection
# colours are mandatory
# user have root access or not
# send packages to install as paramters
#  yum list installed mysql -- to check the list of package installed in server

#sudo sh package-installation.sh mysql git gcc docker

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log


if [ $USERID -ne 0 ]
then 
    echo " Please run with super user "
else 
    echo " You are a super user"
fi

for i in $@
do
   echo " package to install : $i " 
   yum list installed $i &>> $LOG_FILE
   if [ $? -eq 0 ]
   then 
     echo "$i already installed... SKIPPING"
    else
     echo "$i not installed... INSTALL"
    fi
done
