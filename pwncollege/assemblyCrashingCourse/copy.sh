#!/bin/bash

# Copy certain data from the file stream to the clipboard
# Just for some convenience of using remote VNC

if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename or filepath>"
  exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
  echo "File does not exist: $input_file"
  exit 1
fi

# Copy the file's contents to the clipboard using xclip
xclip -selection clipboard < "$input_file"
echo "Copied contents of $input_file to clipboard."
