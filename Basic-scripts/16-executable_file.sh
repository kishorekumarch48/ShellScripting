#!/bin/bash

file_path="$1"

# Check if a path was provided
if [[ -z "$file_path" ]]; then
  echo "ERROR: No file path provided."
  exit 1
fi

# Check if the file exists and is executable
if [[ -x $file_path ]]; then
echo "File is executable."
else
echo "File is not executable or does not exist."
fi
