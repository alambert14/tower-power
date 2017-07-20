#!/bin/bash
cd
alias proj="cd /code/tower-power/Experiment"

python bwc_parse.py &

./wlan0_parser.sh &

cd ~/MTX/SnmpPoller
sudo node server.js 
