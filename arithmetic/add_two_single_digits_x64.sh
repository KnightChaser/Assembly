# Only intended for single-digit number processing
#/bin/bash

read -p "Enter the 1st digit: " first
read -p "Enter the 2nd digit: " second

result=$(($first+$second))
echo "1st digit + 2nd digit: $result";
