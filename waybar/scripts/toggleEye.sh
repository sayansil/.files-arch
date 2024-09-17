#!/bin/bash
# toggleEye.sh: Toggles the wayland-idle-inhibitor.service for the current user.
# Usage: ./toggleEye.sh
# Optimized for brevity and clarity.

# Check if wayland-idle-inhibitor.service is running (for the current user)
if systemctl --user is-active --quiet wayland-idle-inhibitor.service; then
    # If running, stop the service
    echo "Stopping wayland-idle-inhibitor.service..."
    systemctl --user stop wayland-idle-inhibitor.service
else
    # If not running, start the service
    echo "Starting wayland-idle-inhibitor.service..."
    systemctl --user start wayland-idle-inhibitor.service
fi
