dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
useradd roboshop
cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo
mkdir /app
cd /app
npm install
systemctl daemon-reload
dnf install mongodb-mongosh -y
mongosh --host 172.31.29.7 </app/db/master-data.js