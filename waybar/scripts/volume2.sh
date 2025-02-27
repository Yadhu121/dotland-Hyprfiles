#!/bin/bash

# Kill any existing volume UI instance
pkill -f "wofi --dmenu" 2>/dev/null

# Get current volume
VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

# Show a Wofi slider menu
VOLUME=$(seq 0 10 100 | wofi --dmenu --prompt "Set Volume" --width 200 --height 200)

# If user selects a volume value, set it
if [[ -n "$VOLUME" ]]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$VOLUME"% 
fi

