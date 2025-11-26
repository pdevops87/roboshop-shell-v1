nodejs(){
echo -e "\\e[33m disable nodejs \\e[0m"
dnf module disable nodejs -y &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m enable nodejs \\e[0m"
dnf module enable nodejs:20 -y &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m install nodejs \\e[0m"
dnf install nodejs -y &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m Add roboshop user \\e[0m"
useradd roboshop &>>/tmp/roboshop.log
echo $?

echo -e "\\e[33m remove a directory\\e[0m"
rm -rf /app
echo $?

echo -e "\\e[33m make a directory \\e[0m"
mkdir /app &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m download content \\e[0m"
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m navigate to /app \\e[0m"
cd /app &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m unarchive content \\e[0m"
unzip /tmp/$component.zip &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m navigate to /app  \\e[0m"
cd /app &>>/tmp/roboshop.log
echo $?
echo -e "\\e[33m npm install \\e[0m"
npm install &>>/tmp/roboshop.log
echo $?
}
system_Service(){
  echo -e "\\e[33m component service \\e[0m"
  systemctl daemon-reload &>>/tmp/roboshop.log
  systemctl enable $component &>>/tmp/roboshop.log
  systemctl restart $component &>>/tmp/roboshop.log
}

mongodb(){
  echo -e "\\e[33m install mongodb  \\e[0m"
  echo
  dnf install mongodb-mongosh -y &>>/tmp/roboshop.log

  echo -e "\\e[33m load master-data \\e[0m"
  echo
  mongosh --host mongodb-dev.pdevops78.online </app/db/master-data.js &>>/tmp/roboshop.log
}