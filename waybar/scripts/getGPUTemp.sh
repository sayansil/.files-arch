#!/bin/bash

# Extract the profile name from the asusctl command output
temp=$(nvidia-settings -q gpucoretemp -t | xargs)

# Output the result in JSON format
echo "{\"text\": \"$temp\", \"alt\": \"$temp\", \"tooltip\": \"$temp\", \"class\": \"$temp\"}"

