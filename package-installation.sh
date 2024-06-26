#!/bin/bash

# log redirection
# colours are mandatory
# user have root access or not
# send packages to install as paramters
#  yum list installed mysql -- to check the list of package installed in server

#sudo sh package-installation.sh mysql git gcc fail2ban

USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
     echo -e "$2  $R installation Failure $N "
    else 
     echo -e "$2  $G installation SUCCESS $N "
    fi
}

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
     echo -e " $i already installed...$G SKIPPING $N "
    else
     dnf install $i -y &>> $LOG_FILE
     VALIDATE $? "installation of $i"

    fi
done
