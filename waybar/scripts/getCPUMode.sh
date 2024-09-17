#!/bin/bash

# Get the CPU temperature as an integer
temp=$(sensors | awk '/acpitz-acpi-0/,/temp1/ { if ($1 == "temp1:") print $2 }' | tr -d '+' | cut -d '.' -f1)

# Output the JSON object
echo "{\"text\": \"$temp\", \"tooltip\": \"$temp\", \"alt\": \"$temp\", \"class\": \"$temp\"}"
