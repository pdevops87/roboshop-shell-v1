source ./common.sh
component=catalogue
echo -e "\\e[33m Copy catalogue service file \\e[0m"
echo
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\\e[33m Copy mongo repo file \\e[0m"
echo
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\\e[33m run nodejs \\e[0m"
echo
nodejs

echo -e "\\e[33m run mongodb \\e[0m"
echo
mongodb

echo -e "\\e[33m run systemd service\\e[0m"
echo
system_Service

