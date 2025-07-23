#!/bin/bash

# EMPTY STRING --> -z

my_string="$1"

if [[ -z $my_string ]]; then
	echo "The string is empty."
else
	echo "The string is non-empty."
fi

