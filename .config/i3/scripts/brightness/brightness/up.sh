#!/bin/bash

# NOTE: this is under the assumption that external displays brightness is set to 1.0
BRIGHTNESS=(`xrandr --verbose | grep -m 2 -i brightness | cut -f2 -d ' '`)
SECOND_BRIGHTNESS=${BRIGHTNESS[1]}
if [ -z "${SECOND_BRIGHTNESS}" ] 
then 
	SECOND_BRIGHTNESS='1.0'
fi

BRIGHTNESS=$(echo "min(${BRIGHTNESS[0]}, ${SECOND_BRIGHTNESS})" | bc /home/mahan/.config/i3/scripts/brightness/maxmin.bc)

TARGET_BRIGHTNESS=$(echo "min(${BRIGHTNESS} + 0.1, 1.0)" | bc /home/mahan/.config/i3/scripts/brightness/maxmin.bc)
xrandr --output DP-4 --brightness ${TARGET_BRIGHTNESS}

notify-send "brightness up"
