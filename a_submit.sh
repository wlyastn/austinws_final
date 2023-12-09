#!/bin/bash

# Assign the SUB variable to './submissions'
SUB='./submissions'

# Assign the CURR variable to the output of 'date +%Y%m%d_%H%M%S'
CURR=$(date +%Y%m%d_%H%M%S)

# Create the SUB directory if it doesn't exist (-p flag ensures no error if it already exists)
mkdir -p "$SUB"

# Create a directory inside SUB with the name stored in the CURR variable
mkdir -p "$SUB/$CURR"

# Recursively copy Makefile, inc, and src to the CURR named directory inside SUB
cp -r Makefile inc src "$SUB/$CURR"

# Use the tar command to compress CURR directory into a file named $CURR.tar.gz
tar -czf "$SUB/$CURR.tar.gz" -C "$SUB" "$CURR"

# Print the value of the CURR variable and overwrite newest.log in the SUB directory
echo "$CURR" > "$SUB/newest.log"

# Recursively delete the leftover CURR directory in the SUB directory
rm -rf "$SUB/$CURR"

