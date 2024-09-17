#!/bin/bash

# Run checkupdates and get the count of updates
updates=$(checkupdates)

# Count the number of lines (packages) in the updates and subtract 1
count=$(($(echo "$updates" | wc -l) - 1))

# Remove ANSI escape codes and extract package names (removing versions and arrows)
package_names=$(echo "$updates" | sed -r 's/\x1b\[[0-9;]*m//g' | awk '{print $1}' | paste -sd ' ' -)

# Remove non-printable characters (but keep printable ones)
package_names=$(echo "$package_names" | tr -cd '[:print:] ')

# Format the tooltip with count and package names, separated by spaces, if count > 0
if [ "$count" -gt 0 ]; then
  tooltip="$count updates available\r\r$package_names"
else
  tooltip="$count updates available"
fi

# Determine the class based on the count value
if [ "$count" -lt 10 ]; then
  class="few"
elif [ "$count" -ge 10 ] && [ "$count" -le 80 ]; then
  class="normal"
elif [ "$count" -gt 80 ] && [ "$count" -le 150 ]; then
  class="many"
else
  class="broken"
fi

# Create minified JSON output
json_output=$(cat <<EOF
{"text":"$count","tooltip":"$tooltip","alt":"$count","class":"$class"}
EOF
)

# Print JSON output
echo "$json_output"


