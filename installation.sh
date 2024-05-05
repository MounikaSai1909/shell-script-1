#!/bin/bash


USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
   echo " please proceed with installation "
   dnf install mysql -y
else 
    echo " please run the script with root access"
    exit 0 #  manually exit if error comes
fi

dnf install git -y
if [ $? -ne 0 ]
then 
  echo "installation is a failure "
  exit 1
else 
  echo "installation of git is sucess"
  
fi