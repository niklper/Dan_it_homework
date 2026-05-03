#!/bin/bash

APP_USER="APP_USER"
APP_DIR="/home/${APP_USER}"
#PROJECT_DIR="/home/${APP_USER}/petclinic"

echo "---------------------------Starting provisioning for APP_VM---------------------------"

#Creating user for APP_VM with home directory and bash shell, and set empty password
sudo useradd -m -s /bin/bash $APP_USER && passwd -d $APP_USER # or useradd -m -p "" -s /bin/bash $APP_USER NO PASSWORD

#sudo useradd -r -s /usr/sbin/nologin APP_USER #this is creating interactive user, whithout home directory and opportunity enter to terminal
#может лучше такого пользователя создавать? 

#install Java JDK and git
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y openjdk-21-jdk git

#cloning rep from git
#sudo rm -r $PROJECT_DIR # Removing
#sudo rm -r $APP_DIR/*.jar # Removing
#sudo git clone https://gitlab.com/dan-it/groups/devops_soft.git ${PROJECT_DIR}
#cd $PROJECT_DIR

#Maven Wrapper
#sudo ./mvnw clean package

#sudo mv *.jar $APP_DIR
#sudo chown -R $APP_USER:$APP_USER $APP_DIR
#sudo -u $APP_USER



echo "---------------------------Provisioning complete---------------------------"