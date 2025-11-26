component=catalogue

echo -e "\\e[33m Disable nodejs \\e[0m"
echo
dnf module disable nodejs -y &>>/tmp/roboshop.log

echo -e "\\e[33m enable nodejs \\e[0m"
echo
dnf module enable nodejs:20 -y &>>/tmp/roboshop.log

echo -e "\\e[33m copy service file \\e[0m"
echo
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\\e[33m copy mongo repo file \\e[0m"
echo
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\\e[33m install nodejs \\e[0m"
echo
dnf install nodejs -y &>>/tmp/roboshop.log

echo -e "\\e[33m Add Roboshop user \\e[0m"
echo
useradd roboshop &>>/tmp/roboshop.log

echo -e "\\e[33m make a directory \\e[0m"
echo
mkdir /app &>>/tmp/roboshop.log

echo -e "\\e[33m download catalogue component \\e[0m"
echo
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip &>>/tmp/roboshop.log

echo -e "\\e[33m navigate to app directory \\e[0m"
echo
cd /app &>>/tmp/roboshop.log

echo -e "\\e[33m unarchive catalogue component \\e[0m"
echo
unzip /tmp/$component.zip &>>/tmp/roboshop.log

echo -e "\\e[33m navigate to app directory \\e[0m"
echo
cd /app &>>/tmp/roboshop.log

echo -e "\\e[33m install nodejs dependencies \\e[0m"
echo
npm install &>>/tmp/roboshop.log

echo -e "\\e[33m install mongodb  \\e[0m"
echo
dnf install mongodb-mongosh -y &>>/tmp/roboshop.log

echo -e "\\e[33m load master-data \\e[0m"
echo
mongosh --host mondodb-dev.pdevops78.online </app/db/master-data.js &>>/tmp/roboshop.log

echo -e "\\e[33m reload/update schema \\e[0m"
echo
systemctl daemon-reload &>>/tmp/roboshop.log

echo -e "\\e[33m reboot catalogue service \\e[0m"
echo
systemctl enable $component &>>/tmp/roboshop.log

echo -e "\\e[33m restart catalogue service \\e[0m"
echo
systemctl restart $component &>>/tmp/roboshop.log