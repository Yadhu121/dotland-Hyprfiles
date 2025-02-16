#!/bin/bash

case $1 in
    "scroll-up")
        # Increase brightness by 5%
        brightnessctl set +5% > /dev/null
        ;;
    "scroll-down")
        # Decrease brightness by 5%
        brightnessctl set 5%- > /dev/null
        ;;
    "click")
        # Prompt user for brightness level
        CURRENT=$(brightnessctl g)
        MAX=$(brightnessctl m)
        PERCENTAGE=$((CURRENT * 100 / MAX))

        NEW_BRIGHTNESS=$(zenity --scale --text="Set Brightness Level" --value="$PERCENTAGE" --min-value=0 --max-value=100)
        if [ $? -eq 0 ]; then
            brightnessctl set "$NEW_BRIGHTNESS%" > /dev/null
        fi
        ;;
esac

# Always output the current brightness percentage
BRIGHTNESS=$(brightnessctl g)
MAX=$(brightnessctl m)
PERCENTAGE=$(( BRIGHTNESS * 100 / MAX ))
echo " $PERCENTAGE%"

