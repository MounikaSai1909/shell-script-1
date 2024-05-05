#!/bin/bash


USERID=$(id -u)

if [ $USERID -eq 0 ]
then 
   echo " please proceed with installation "
   dnf install mysql -y
else 
    echo " please run the script with root access"
    exit 1 #  manually exit if error comes
fi

dnf install git -y
if [ $? -ne o ]
then 
  echo "installation is a failure "
  exit 1
else 
  echo "installation of git is sucess"
  
fi