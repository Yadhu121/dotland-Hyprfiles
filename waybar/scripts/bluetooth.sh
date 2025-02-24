#!/bin/bash

bar_height=1
icon_offset=1520

eval $(wlrctl layer-shell list | jq -r '
    .[] | select(.namespace=="waybar") | 
    .exclusive_zone as $bar_height | 
    .output_geometry as $screen | 
    .surfaces[] | select(.namespace=="waybar.bluetooth") | 
    "X=\(.geometry.x) Y=\($bar_height + .geometry.y)"')

X=$((X + icon_offset))
Y=$((Y + bar_height)) 

wofi --dmenu --width 250 --height 200 --location 1 --xoffset $X --yoffset $Y <<EOF
Toggle Bluetooth
Scan Devices
EOF

