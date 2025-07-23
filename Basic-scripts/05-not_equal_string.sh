#!/bin/bash

string1="$1"
string2="$2"

if [[ $string1 != $string2 ]]; then
	echo "String are not equal."
else
	echo "Strings are equal."
fi

