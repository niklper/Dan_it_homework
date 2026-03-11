#!/bin/bash

read -p "Enter the text: " TEXT

echo "$TEXT" | awk '{for(i=NF;i>=1;i--) printf "%s ", $i; print ""}'
