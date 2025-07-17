#!/bin/bash

# Get current volume
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '{ print $2 }' | tr -d ' %')

# If above 5, decrease by 5%
if [ "$vol" -gt 5 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
fi
