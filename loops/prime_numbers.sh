#!/bin/bash

function isPrimeNumber() {

    local number=$1

    for ((j = 2; j < number; j++)); do
        if ((number % j == 0)); then
            return 1
        fi
    done

    return 0
}

read -p "Enter the upper limit: " number

for ((i = 2; i < number; i++)); do
    if isPrimeNumber "$i"; then
        echo "$i"
    fi
done
