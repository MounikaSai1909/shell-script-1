
#USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE (){
   if [ $1  -ne 0 ]
   then
       echo "$2... FAILURE "
       exit 1
   else
       echo "$2.. SUCCESS"
   fi  


}


dnf install mysql -y &>> $LOG_FILE
VALIDATE $? "installing MySQL"


dnf install git -y &>> $LOG_FILE
VALIDATE $? "installing Git"

dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "installing nodejs"
