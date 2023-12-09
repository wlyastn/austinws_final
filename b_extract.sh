#!/bin/bash

# Assign the SUB variable to './submissions'
SUB='./submissions'

# Assign the NEWLOG variable to '$SUB/newest.log'
NEWLOG="$SUB/newest.log"

# Check if the submissions directory oes not exist
if [ ! -d "$SUB" ]; then
  echo "Submissions directory '$SUB' does not exist."
  exit 1
fi

# Check if the NEWLOG file does not exist
if [ ! -f "$NEWLOG" ]; then
  echo "Newest log file '$NEWLOG' does not exist."
  exit 1
fi

# Assign the NEWEST variable to the first line of the NEWLOG file
NEWEST=$(head -n 1 "$NEWLOG")

# Assign the NEWTAR variable to '$SUB/$NEWEST.tar.gz'
NEWTAR="$SUB/$NEWEST.tar.gz"

# Check if the NEWTAR file does not exist
if [ ! -f "$NEWTAR" ]; then
  echo "Newest tar file '$NEWTAR' does not exist."
  exit 1
fi

# Create a directory named 'testing' in the current directory (if it doesn't exist)
mkdir -p testing

# Use the tar command to extract the NEWTAR file into the 'testing' directory
tar -xzf "$NEWTAR" -C testing
