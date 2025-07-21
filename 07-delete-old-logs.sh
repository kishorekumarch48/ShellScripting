#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/var/log/messages-logs"
LOGS_FOLDER="/var/log/shellscripting-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

mkdir -p "$LOGS_FOLDER"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

CHECK_ROOT(){
    if [ $USERID -ne 0 ]; then
        echo "ERROR:: You must have sudo access to execute this script" | tee -a "$LOG_FILE_NAME"
        exit 1
    fi
}

CHECK_ROOT

echo "Script Started executing at: $TIMESTAMP" | tee -a "$LOG_FILE_NAME"

find "$SOURCE_DIR" -name "messages_202507*.log" -mtime +5 | while read -r filepath
do
    echo "Deleting file: $filepath" | tee -a "$LOG_FILE_NAME"
    rm -f "$filepath"
done

