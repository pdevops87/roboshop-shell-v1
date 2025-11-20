dnf module disable nodejs -y
dnf module enable nodejs:20 -y

cp cart.service /etc/systemd/system/cart.service
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip
cd /app
unzip /tmp/cart.zip
systemctl daemon-reload
systemctl enable cart
systemctl restart cart
