# Step1



## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

## Add your files

* [Create](https://docs.gitlab.com/user/project/repository/web_editor/#create-a-file) or [upload](https://docs.gitlab.com/user/project/repository/web_editor/#upload-a-file) files
* [Add files using the command line](https://docs.gitlab.com/topics/git/add_files/#add-files-to-a-git-repository) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin https://gitlab.com/niklkoud20/step1.git
git branch -M main
git push -uf origin main
```
##Не інтерактивно підключитись до GitLab в мене не вийшло, тому вручну скачував репозиторій, надава права та клонував його

## Before start up Vagrant need enter next variables
export DB_USER=petclinic_USER
export DB_PASS=petclinic_PASSWD
export DB_NAME=petclinic

##Command for entering Mysql
mysql -u petclinic_USER -p -h 192.168.30.11

 #export DB_HOST=192.168.30.11
 #export DB_PORT=3306
 #export DB_NAME=petclinic
 #export DB_USER=petclinic_USER
 #export DB_PASS=petclinic_PASSWD