source ./common.sh
component=catalogue
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

nodejs
mongodb
systemd_Service