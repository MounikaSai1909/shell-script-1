#!/bin/bash


USERID=$(id -u)

if [ $uSERID -eq 0 ]
then 
   echo " please proceed with installation "
   dnf install mysql -y
else 
    echo " please run the script with root access"
    exit 1 #  manually exit if error comes
fi