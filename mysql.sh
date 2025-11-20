dnf install mysql-server -y
mysql_secure_installation --set-root-pass RoboShop@1
systemctl enable mysqld
systemctl restart mysqld