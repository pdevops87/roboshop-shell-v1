nodejs(){
dnf module disable nodejs -y &>>/tmp/roboshop.log
dnf module enable nodejs:20 -y &>>/tmp/roboshop.log
dnf install nodejs -y &>>/tmp/roboshop.log
useradd roboshop &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log
unzip /tmp/$component.zip
echo -e "\\e[33m navigate to /app directory \\e[0m"
echo
cd /app &>>/tmp/roboshop.log
echo -e "\\e[33m npm install \\e[0m"
echo
npm install &>>/tmp/roboshop.log
}
system_Service(){
  systemctl daemon-reload &>>/tmp/roboshop.log
  systemctl enable $component &>>/tmp/roboshop.log
  systemctl start $component &>>/tmp/roboshop.log
}

mongodb(){
  echo -e "\\e[33m install mongodb  \\e[0m"
  echo
  dnf install mongodb-mongosh -y &>>/tmp/roboshop.log

  echo -e "\\e[33m load master-data \\e[0m"
  echo
  mongosh --host mondodb-dev.pdevops78.online </app/db/master-data.js &>>/tmp/roboshop.log
}