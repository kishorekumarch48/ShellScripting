#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
	echo "ERROR:: you must have sudo access to execute this script"
	exit 1
fi

dnf list installed nginx

if [ $? -ne 0 ];	
then
	dnf install nginx -y
	if [ $? -ne 0 ];
	then
		echo "Installing NGINX ... FAILURE"
		exit 1
	else
		echo "Installing NGINX ... SUCCESS"
	fi
else
	echo "NGINX is already ... INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing Git ... FAILURE"
        exit 1
    else
        echo "Installing Git ... SUCCESS"
    fi
else
    echo "Git is already ... INSTALLED"
fi
