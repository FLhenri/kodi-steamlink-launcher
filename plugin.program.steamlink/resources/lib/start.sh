#!/bin/bash

DIRNAME=$( dirname "${BASH_SOURCE[0]}" )

sudo openvt -c 7 -s -f -- su kodi -c "bash ${DIRNAME}/heartbeat.sh &"
sleep 5

sudo systemctl stop kodi 

exit
