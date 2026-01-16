#!/bin/bash

# Get the active window's info (adjust the command if 'jq' or niri client-info format changes)
WINDOW_INFO=$(niri msg client-info --pretty)
# Extract the column width proportion (this might need adjustment based on the exact output format)
CURRENT_WIDTH_PROPORTION=$(echo "$WINDOW_INFO" | grep "column_proportion" | awk '{print $2}' | tr -d ',')

# Define the target widths
WIDTH_50="50%"
WIDTH_100="100%"

# Check the current width and toggle
if [ "$CURRENT_WIDTH_PROPORTION" == "1.0" ]; then
  niri msg set-column-width "$WIDTH_50"
else
  niri msg set-column-width "$WIDTH_100"
fi
