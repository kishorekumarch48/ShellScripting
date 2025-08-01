#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
	if [ $1 -ne 0 ]; then
		echo -e "$2 ... $R FAILURE"
		exit 1
	else
		echo -e "$2 ... $G SUCCESS"
	fi
}

if [ $USERID -ne 0 ]; then
	echo "ERROR:: You must have sudo access to execute this script"
	exit 1
fi

dnf list installed git

if [ $? -ne 0 ]; then
	dnf install git -y
	VALIDATE $? "Installing Git"
else
	echo -e "GIT is already ... $Y Installed."
fi

dnf list installed maven

if [ $? -ne 0 ]; then
	dnf install maven -y
	VALIDATE $? "Installing Maven"
else
	echo -e "Maven is already ... $Y Installed."
fi
