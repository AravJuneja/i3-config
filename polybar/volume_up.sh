#!/bin/bash

# Get current volume
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{ print $2 }' | tr -d ' %')

# If under 100, increase by 5%
if [ "$vol" -lt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi
