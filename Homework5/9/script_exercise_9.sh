#!/bin/bash

read -p "Enter the file path? which need to copy - " PATH1
read -p "Enter the path where need to paste the file - " PATH2


cp $PATH1 $PATH2
