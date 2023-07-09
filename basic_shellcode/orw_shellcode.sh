#!/bin/bash

filename="/tmp/flag"

while read line; do
        echo $line
        n=$((n+1))

done < $filename
