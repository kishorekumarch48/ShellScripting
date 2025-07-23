#!/bin/bash

num1=$1
num2=$2

if [[ $num1 -eq $num2 ]]; then
	echo "Numbers are equal"
else
	echo "Numbers are not equal"
fi
