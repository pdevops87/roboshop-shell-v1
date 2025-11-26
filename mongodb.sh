echo -e "\\e[33m copy mongo repo\\e[0m"
echo
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\\e[33m install mongo\\e[0m"
echo
dnf install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\\update address\\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/'  /etc/mongod.conf &>>/tmp/roboshop.log

systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log
