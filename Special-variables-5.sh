#!/bin/bash

echo "All variables : $@ "
echo "Number of varaibles : $# "
echo "Script name : $0 "
echo "current working directory : $PWD "
echo "home directory of current user : $HOME "
echo "which user is running script : $USER "
echo "Hostname : $HOSTNAME "
echo "process id of current shell script : $$ "

sleep 60 &
echo "process if of last background command : $! "