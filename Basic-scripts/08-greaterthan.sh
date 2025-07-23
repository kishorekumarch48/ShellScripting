num1=$1
num2=$2

if [[ $num1 -gt $num2 ]]; then
echo "number 1 is greater than number 2."
elif [[ $num1 -eq $num2 ]]; then
echo "number 1 is equal to number 2."
else
echo "number 1 is less than number 2."
fi
