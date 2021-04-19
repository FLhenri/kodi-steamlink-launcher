#!/bin/bash

while pgrep kodi &>/dev/null; do
  sleep 5
done

sudo openvt -c 7 -s -f -- su kodi -c "/usr/bin/xinit /bin/sh -c 'xrandr -s 0; /usr/bin/steamlink' -- :0 -quiet -nolisten tcp"
sleep 5

while pgrep steamlink &>/dev/null; do
  sleep 5
done

sudo systemctl restart kodi
