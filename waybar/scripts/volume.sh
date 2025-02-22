#!/bin/bash

# Get the current volume level
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

# Use slurp to select the volume level
NEW_VOLUME=$(slurp -o | awk -F',' '{print int(($1 / 1920) * 100)}')

# If the user didn't cancel, set the new volume
if [ -n "$NEW_VOLUME" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $(echo "$NEW_VOLUME / 100" | bc -l)
fi

