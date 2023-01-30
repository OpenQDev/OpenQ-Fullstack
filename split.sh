#!/bin/bash

# Check if data is passed as a command line argument
if [ $# -eq 0 ]; then
	echo "No data provided as command line argument"
	exit 1
fi

data="$1"
echo "========================="

# Use the `fold` command to split the data on a new line every 64 characters
fold -w 64 <<<"$data"
