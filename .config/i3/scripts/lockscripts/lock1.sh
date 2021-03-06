#!/bin/bash

if [ -z `pidof i3lock` ]
then

	pactl set-sink-mute 0 1

	scrot /tmp/screen.png

	convert -resize 10% /tmp/screen.png /tmp/screen.png
	convert -resize 1000% /tmp/screen.png /tmp/screen.png

	composite -geometry +500+167 /home/mahan/.config/i3/lockpngs/lock1.png /tmp/screen.png /tmp/lock.png

	composite -geometry +500+1247 /home/mahan/.config/i3/lockpngs/lock1.png /tmp/lock.png /tmp/lock.png 


	i3lock -u -i /tmp/lock.png

	# Turn the screen off after a delay.
	#sleep 300; pgrep i3lock && xset dpms force off

	rm /tmp/screen.png
	rm /tmp/lock.png
fi
