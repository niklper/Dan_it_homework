#!/bin/bash

read -p "Enter the file name: " NAME_FILE

if [ -e "$NAME_FILE" ]
then
        echo "$NAME_FILE is exists"
else
        echo "$NAME_FILE is not exists!!!"
fi
