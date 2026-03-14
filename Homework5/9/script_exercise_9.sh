  GNU nano 7.2                                           script_exercise_9.sh
#!/bin/bash

NAME_FILE=$1

#read -p "Enter the file name: " NAME_FILE

if [ ! -e "$NAME_FILE" ]
then
        echo "$NAME_FILE is not exists"
elif [ ! -s "$NAME_FILE" ]
then
        echo "$NAME_FILE is empty"
else
        echo "Content the $NAME_FILE : "
        cat "$NAME_FILE"
fi