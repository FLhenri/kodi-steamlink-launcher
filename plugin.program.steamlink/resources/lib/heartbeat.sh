#!/bin/bash

while pgrep kodi &>/dev/null; do
  sleep 5
done

sudo openvt -c 7 -s -f -- su kodi -c "/usr/bin/xinit /bin/sh -c 'xrandr -s 0; /usr/bin/steamlink' -- :0 -quiet -nolisten tcp"
sleep 5

export DISPLAY=:0
sleep 1
nom_ecran=$(sudo xdotool search --onlyvisible .)
test=0
sudo xdotool click 1

while test $test = 0; do
  if test $(sudo xdotool search --onlyvisible .); then
  	if test ! $nom_ecran = $(sudo xdotool search --onlyvisible .); then
	    test=1
	  fi
  else 
    export DISPLAY=:0
	fi
  sleep 5
done

while test $test = 1; do
  if test $(sudo xdotool search --onlyvisible .); then
  	if test $nom_ecran = $(sudo xdotool search --onlyvisible .); then
      test=2
	  fi
  else 
    export DISPLAY=:0
  fi
  sleep 5
done

while test $test = 2; do
  if test $(sudo xdotool search --onlyvisible .); then
	  if test $nom_ecran = $(sudo xdotool search --onlyvisible .); then
	    sudo xdotool click 1
	    sudo xdotool key Escape
	    test=3
	  fi
  else 
    export DISPLAY=:0
	fi
  sleep 5
done

while pgrep steamlink &>/dev/null; do
  sleep 5
done

sudo systemctl restart kodi
