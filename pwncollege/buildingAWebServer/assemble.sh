#!/bin/bash

# Check if an argument (filename) is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename="$1"
base_filename="${filename%.*}"

# Run the specified commands with the extracted filename
as -o "$base_filename.obj" "$filename" && ld -o "$base_filename.out" "$base_filename.obj"

# Was the given operation successful?
if [ $? -eq 0 ]; then
  echo "Compilation and linking successful."
else
  echo "Compilation and linking failed."
fi
