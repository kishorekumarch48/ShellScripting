#!/bin/bash

file_path="/drives/c/Users/ABC/Desktop/gitfol/shellscripts/shell-scripts/file.txt"

if [[ -e $file_path && -r $file_path ]]; then
  echo "File exists and is readable."
  
  while read -r line; do
    echo "$line"
  done < "$file_path"   # 🔧 This line reads from the file

else
  echo "File does not exist or is not readable."
fi

