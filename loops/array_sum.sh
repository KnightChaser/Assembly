#!/bin/bash

arr1=(1 2 3 4 5 6 7 8 9 10)
sum=0

for num in "${arr1[@]}"; 
do
    ((sum += num))
done

echo "The sum of the array is: $sum"
