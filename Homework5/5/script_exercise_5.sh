#!/bin/bash

read -p "Enter the file path? which need to copy - " PATH1

if [ ! -f "$PATH1" ]
then
        echo "$PATH1 is not a file"
        exit 1
else
        read -p "Enter the path where need to paste the file - " PATH2
        cp $PATH1 $PATH2
fi
