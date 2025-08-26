#!/bin/bash
# fancyfloat.sh

# set dimensions (pixel or percent)
WIDTH="50%"
HEIGHT="60%"

json=$(hyprctl activewindow -j)
floating=$(echo "$json" | jq '.floating')

if [ "$floating" = "false" ]; then
  hyprctl dispatch togglefloating
  hyprctl dispatch resizeactive exact $WIDTH $HEIGHT
  hyprctl dispatch centerwindow
else
  hyprctl dispatch togglefloating
fi
