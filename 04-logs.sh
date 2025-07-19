USERID=(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscripting-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
	if [ $1 -ne 0 ]; then
		echo -e "$2 ... $R FAILED $N"
		exit 1
	else
		echo -e "$2 ... $G SUCCESS $N"
	fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]; then
	echo "ERROR:: You must have sudo access to execute this script"
	exit 1
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]; then
	dnf install git -y &>>$LOG_FILE_NAME
	VALIDATE $? "Installing Git"
else
	echo -e "GIT is already ... $Y Installed $N"
fi

dnf list installed maven &>>$LOG_FILE_NAME

if [ $? -ne 0 ]; then
	dnf install maven -y &>>$LOG_FILE_NAME
	VALIDATE $? "Installing Maven"
else
	echo -e "Maven is already ... $Y Installed $N"
fi

#sudo dnf remove nginx -y
#sudo dnf remove git -y
