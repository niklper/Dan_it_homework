#!/bin/bash

NUMB=$1

if [[ -z "$NUMB" || "$NUMB" == 0 ]]; then
        echo "You havent entered anything"
else
        for (( i=1; i <= "$NUMB"; i++ ))
        do
                read -p "Enter $i fruit:" MASS[i]
        done

        echo "List of fruits:"

                for (( i=1; i <= "$NUMB"; i++ ))
        do
                echo "$i - " ${MASS["$i"]}
        done
fi