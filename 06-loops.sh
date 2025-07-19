USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscripting-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# Create log directory if it doesn't exist
mkdir -p $LOG_FOLDER

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
        echo "ERROR:: You must have sudo access to execute this script" | tee -a $LOG_FILE_NAME
        exit 1
fi

}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT


for package in $@
do
	dnf list installed @package  &>>$LOG_FILE_NAME
	if [ $? -ne 0 ]; then
		dnf install $package -y &>>$LOG_FILE_NAME
		VALIDATE $? "Installing $package"
	else
		echo -e "$package is already ... $Y Installed $N" | tee -a $LOG_FILE_NAME
	fi
done

