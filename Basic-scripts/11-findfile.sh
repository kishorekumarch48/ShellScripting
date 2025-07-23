#!/bin/bash

find_file="/drives/c/Users/ABC/Desktop/gitfol/shellscripts/shell-scripts/file.txt"

if [[ -e $find_file ]]; then
echo "File exists."
else
echo "File does not exist."
fi
