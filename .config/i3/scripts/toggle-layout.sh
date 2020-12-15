#!/bin/bash

(setxkbmap -query | grep -q "layout:\s\+us") && setxkbmap -model pc104 ir || setxkbmap -model 104 us

