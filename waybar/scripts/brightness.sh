#!/bin/bash

case $1 in
    "scroll-up")
        brightnessctl set +5% > /dev/null
        ;;
    "scroll-down")
        brightnessctl set 5%- > /dev/null
        ;;
    "click")
        CURRENT=$(brightnessctl g)
        MAX=$(brightnessctl m)
        PERCENTAGE=$((CURRENT * 100 / MAX))

        NEW_BRIGHTNESS=$(zenity --scale --text="Set Brightness Level" --value="$PERCENTAGE" --min-value=0 --max-value=100)
        if [ $? -eq 0 ]; then
            brightnessctl set "$NEW_BRIGHTNESS%" > /dev/null
        fi
        ;;
esac

BRIGHTNESS=$(brightnessctl g)
MAX=$(brightnessctl m)
PERCENTAGE=$(( BRIGHTNESS * 100 / MAX ))
echo " $PERCENTAGE%"

