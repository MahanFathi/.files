#!/bin/bash

if [ -z `pidof i3lock` ]
then

	arr[0]="$HOME/.config/i3/scripts/lockscripts/lock1.sh"
	arr[1]="$HOME/.config/i3/scripts/lockscripts/lock2.sh"
	arr[2]="$HOME/.config/i3/scripts/lockscripts/lock3.sh"
	arr[3]="$HOME/.config/i3/scripts/lockscripts/lock4.sh"
	arr[4]="$HOME/.config/i3/scripts/lockscripts/lock5.sh"

	rand=$[ $RANDOM % 5 ]

	exec ${arr[$rand]}

fi
