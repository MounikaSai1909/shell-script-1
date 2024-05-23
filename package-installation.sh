#!/bin/bash

# log redirection
# colours are mandatory
# user have root access or not
# send packages to install as paramters

#sudo sh package-installation.sh mysql git gcc docker

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo " Please run with super user "
else 
    echo " You are a super user"
fi

for i in $@
do
echo " package to install : $i " 
done
