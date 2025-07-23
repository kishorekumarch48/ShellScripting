#!/bin/bash


file_path="$1"

if [[ -z $file_path ]]; then
echo "ERROR: No path provided"
exit 1
fi

if [[ -f $file_path ]]; then
echo "It is a regular file"
elif [[ -d $file_path ]]; then
echo "It is a directory."
elif [[ -L $file_path ]]; then
echo "It is a symbolic link."
else
echo "It is not a regular file, directory, or symlink — may not exist."
fi
