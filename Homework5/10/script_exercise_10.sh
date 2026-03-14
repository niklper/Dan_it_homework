#!/bin/bash

#тут я начал через циклы и сравнения старого варианта с новым найти только что созданный файл

#PATH1=/home/server/backup.txt
#NUMB_OLD=wc -l < $PATH1
#
#MASS_OLD["$NUMB_OLD"]
#for (( i=2; i <= "$NUMB_OLD"; i++ ))
#do
#       MASS_OLD["$i"]=$(sed -n '"$i"p' /home/server/backup.txt)
#done
#
#ls -l | awk '{print $9}' > backup.txt
#
#NUMB_NEW=ls -l | awk '{print $9}' | wc -l
#MASS_NEW["$NUMB_NEW"]
#for (( i=2; i <= "$NUMB_NEW"; i++ ))
#do
#       MASS_NEW["$i"]=$(sed -n '"$i"p' /home/server/backup.txt)
#done
#
#
#for (( i=2; i <= "$NUMB_OLD"; i++ ))
#do
#       for (( i=2; i <= "$NUMB_NEW"; i++ ))
#       do
#               if [[MASS_OLD]]
#       done
#done
#
#
#ls -l | awk '{print $9}' > backup.txt

#тут хотел через команду find. Если выполнять через скрипт, показывает ошибку. Если по отдельности в терменале команды, то все ОК
#Не смог разобраться 
FILE_NAME=find /watch -mmin -1 -ls | sed -n '2,$p' | awk '{print $11}'
echo "$FILE_NAME"
mv "$FILE_NAME" "${FILE_NAME%.txt}.back"
#mv "$FILE_NAME" "$FILE_NAME".back
