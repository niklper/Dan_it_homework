#!/bin/bash

#read -p "Enter the name file: " PATH1

FILE=$1

if [ ! -f "$FILE" ]
then
        echo "$FILE is not a file"
        exit 1
else
        echo -n "The numbers of lines in that file is "; wc -l < $FILE
fi