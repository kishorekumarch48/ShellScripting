#!/bin/bash

string1="$1"
string2="$2"

if [[ $string1 == $string2 ]]; then
	echo "String are equal."
else
	echo "Strings are not equal."
fi

