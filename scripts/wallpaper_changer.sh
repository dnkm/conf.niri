#!/bin/bash

# Recursive path to your wallpaper folder
WALLPAPER_FOLDER="$HOME/Pictures/Wallpapers"
INTERVAL=600

while true; do
  # 'find' searches subfolders by default; added -iname to match common image types
  FILE=$(find "$WALLPAPER_FOLDER" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) | shuf -n 1)

  if [ -n "$FILE" ]; then
    pkill -x swaybg
    swaybg -i "$FILE" -m fill &
  fi

  sleep $INTERVAL
done
