#!/bin/bash

# Add a 1-second delay
sleep 1

# Extract the profile name from the asusctl command output
profile=$(asusctl profile -p | grep "Active profile" | awk '{print $NF}' | tr '[:upper:]' '[:lower:]' | xargs)

# Output the result in JSON format
echo "{\"text\": \"$profile\", \"tooltip\": \"Mode: $profile\", \"alt\": \"$profile\", \"class\": \"$profile\"}"

