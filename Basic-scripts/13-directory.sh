#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

path="$1"

if [[ -z "$path" ]]; then
  echo -e "${R}ERROR:${N} No path provided."
  exit 1
fi

if [[ -d "$path" ]]; then
  echo -e "${G}This is a directory:${N} $path"
elif [[ -f "$path" ]]; then
  echo -e "${Y}This is a file:${N} $path"
else
  echo -e "${R}ERROR:${N} $path does not exist or is not a regular file/directory"
fi

