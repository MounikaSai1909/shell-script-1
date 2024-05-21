
#USERID=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
echo " SCRIPT_NAME : $SCRIPT_NAME "
TIMESTAMP=$(date +%F-%H-%M-%S)
echo " TIMESTAMP : $TIMESTAMP "
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
echo " LOG_FILE : $LOG_FILE "

COLOURS= $(echo "\e[31m Hello World")
echo " COLOURS : $COLOURS "
#

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
