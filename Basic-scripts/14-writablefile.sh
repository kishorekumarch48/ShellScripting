#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

file_path="$1"

if [[ -z $file_path ]]; then
echo -e "${R}ERROR:${N} No path provided."
exit 1
fi

if [[ -w $file_path ]]; then
echo "File is writable."
else
echo "File is not writable or does not exist."
fi
