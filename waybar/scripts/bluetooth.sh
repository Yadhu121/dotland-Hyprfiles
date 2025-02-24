#!/bin/bash

devices=$(bluetoothctl devices | awk '{print $2, $3, $4, $5}')

selected=$(echo -e "Toggle Bluetooth\n$devices" | wofi --dmenu --width 300 --lines 10)

if [[ "$selected" == "Toggle Bluetooth" ]]; then
    bluetoothctl power toggle
elif [[ -n "$selected" ]]; then
    mac=$(echo "$selected" | awk '{print $1}')
    bluetoothctl connect "$mac"
fi

