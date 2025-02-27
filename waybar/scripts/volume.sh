#!/bin/bash

# Path to a temporary file that tracks clicks
CLICK_FILE="/tmp/waybar-volume-click"

# Check if the file exists from a previous click
if [ -f "$CLICK_FILE" ]; then
    # If the file exists, it means this is a double-click
    rm "$CLICK_FILE"
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
else
    # Otherwise, create the file and wait for another click
    touch "$CLICK_FILE"
    (sleep 0.3 && [ -f "$CLICK_FILE" ] && rm "$CLICK_FILE" && ~/.config/waybar/scripts/volume2.sh) &
fi

