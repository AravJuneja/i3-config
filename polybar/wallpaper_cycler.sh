#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="/home/aravjuneja/Pictures/wallpaper"

# File to store the index of the current wallpaper
INDEX_FILE="/home/aravjuneja/.config/polybar/wallpaper_index"

# i3 config file
I3_CONFIG="/home/aravjuneja/.config/i3/config"

# Get a list of all wallpapers in the directory
WALLPAPERS=($WALLPAPER_DIR/*)

# Get the total number of wallpapers
NUM_WALLPAPERS=${#WALLPAPERS[@]}

# Get the current wallpaper index
if [ -f "$INDEX_FILE" ]; then
  CURRENT_INDEX=$(cat "$INDEX_FILE")
else
  CURRENT_INDEX=0
fi

# Calculate the index of the next wallpaper
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % NUM_WALLPAPERS ))

# Get the next wallpaper path
NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"

# Update the i3 config file
sed -i "s#^exec_always --no-startup-id feh --bg-fill .*#exec_always --no-startup-id feh --bg-fill $NEXT_WALLPAPER#" "$I3_CONFIG"

# Save the new index
echo "$NEXT_INDEX" > "$INDEX_FILE"

# Reload i3 to apply the new wallpaper
/usr/bin/i3-msg reload