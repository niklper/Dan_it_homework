#!/bin/bash

echo "---------------------------Starting provisioning for DB_VM---------------------------"
#install mysql server
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y mysql-server #install server`s version

#private port from Vagrant
sudo sed -i "s/bind-address.*/bind-address = 192.168.30.11/" /etc/mysql/mysql.conf.d/mysqld.cnf

#restart mysql arter setting private port
sudo systemctl restart mysql

#Creating database "Pet_Clinic"
sudo mysql -u root -e "CREATE DATABASE if not exists $DB_NAME;"
sudo mysql -u root -e "CREATE USER if not exists '$DB_USER'@'192.168.30.%' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'192.168.30.%';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"


echo "---------------------------Provisioning complete---------------------------"