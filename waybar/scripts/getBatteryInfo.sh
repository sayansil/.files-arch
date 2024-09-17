#!/bin/bash
# batteryInfo.sh: Extracts battery information and outputs it in JSON format

# Get battery information
battery_info=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1)

# Extract required values using grep and awk
state=$(echo "$battery_info" | grep "state:" | awk '{print $2}')
energy_rate=$(echo "$battery_info" | grep "energy-rate:" | awk '{print $2}')
capacity=$(echo "$battery_info" | grep "capacity:" | awk '{print $2}')
time_to_empty=$(echo "$battery_info" | grep "time to empty:" | awk '{print $4, $5}')
percentage=$(echo "$battery_info" | grep "percentage:" | awk '{print $2}')

# Output the extracted values in JSON format
echo -e "{
  \"state\": \"$state\",
  \"usage\": \"$energy_rate W\",
  \"health\": \"$capacity%\",
  \"ttl\": \"$time_to_empty\",
  \"remaining\": \"$percentage\"
}"

