#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#for path in "$@"
#do
#if [[ -f "$path" ]]; then
#    size=$(stat -c%s "$path")  # Use `stat` to get size in bytes
#    echo -e "${Y}File:${N} $path - ${G}Size:${N} $size bytes"
#  else
#    echo -e "${R}Not a file or doesn't exist:${N} $path"
#  fi
#done



if [[ $# -eq 0 ]]; then   #number of args
  echo -e "${R}ERROR:${N} No path provided."
  exit 1
fi

for file_path in "$@"; do  #all arguments individually
  if [[ -f "$file_path" ]]; then
    if [[ -s "$file_path" ]]; then
      size=$(ls -lh "$file_path" | awk '{print $5}')
      echo -e "${G}File:${N} $file_path — Size: ${Y}$size${N}"
    else
      echo -e "${Y}File:${N} $file_path exists but is 0 bytes."
    fi
  else
    echo -e "${R}ERROR:${N} $file_path does not exist or is not a file."
  fi
done

