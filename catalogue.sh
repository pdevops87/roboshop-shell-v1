component=catalogue

echo -e "\\e[33m copy catalogue service"
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\\e[33m copy mongo repo file \\e[0m"
echo
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

source ./common.sh
nodejs
mongodb
systemd_Service