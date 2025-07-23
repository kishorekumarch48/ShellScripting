#!/bin/bash

# EMPTY STRING --> -z

my_string="$1"
#my_string="kishore"

if [[ -n $my_string ]]; then
	echo "The string is not empty."
else
	echo "The string is empty."
fi

