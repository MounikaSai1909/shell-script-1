
#USERID=$(id -u)

VALIDATE (){
 #    if [ $1  -ne 0 ]
 #    then
 #        echo "$2... FAILURE "
 #        exit 1
 #    else
 #         echo "$2.. SUCCESS"
 #    fi  
  echo " first argument : $1"
  echo " seconf argument : $2"

}


dnf install mysql -y
VALIDATE $? "installing MySQL"


dnf install git -y
VALIDATE $? "installing Git"