#!/bin/bash
#set -x
NUMB=$(($RANDOM % 100 + 1))
echo "$NUMB"
FLAG_LOSE=0

function compare(){
        if [ $NUMB_USER -eq $NUMB ]
        then
                echo "---You won! Сongratulations!---"
                FLAG_WIN=1
                exit 1
        elif [ $NUMB_USER -ne $NUMB ]
        then
                 if [ $NUMB_USER -gt $NUMB ]
                 then
                         echo "---Your number is higher!---"
                 elif [ $NUMB_USER -lt $NUMB ]
                 then
                         echo "---Your number is lower!---" 
                 fi     
        fi
}

function main(){
        for (( i=1; i <=6 ; i++ ))
        do
                if [ "$i" -eq 6 ]
                then
                        echo "You lost, the correct number generated was $NUMB"
                        exit 1
                elif [ "$i" -eq 1 ]
                then
                        read -p "What number was generated ? You have 5 attempts - " NUMB_USER
                else
                        read -p "Enter the number again - " NUMB_USER
                fi
                compare
        done   
}

main