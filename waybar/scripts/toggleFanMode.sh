#!/bin/bash

# Switch to the next performance profile
asusctl profile -n

# Extract the new active profile name
profile=$(asusctl profile -p | grep "Active profile" | awk '{print $NF}' | tr '[:upper:]' '[:lower:]' | xargs)

# Check the active profile and run corresponding commands
if [ "$profile" == "quiet" ]; then
    # Commands to run for the 'quiet' profile
    # Add your commands here
    echo "Switched to quiet profile"
elif [ "$profile" == "balanced" ]; then
    # Commands to run for the 'balanced' profile
    # Add your commands here
    echo "Switched to balanced profile"
elif [ "$profile" == "performance" ]; then
    # Commands to run for the 'performance' profile
    # Add your commands here
    echo "Switched to performance profile"
else
    echo "Unknown profile: $profile"
fi
