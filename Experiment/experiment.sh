#!/bin/bash

cd ~/code/tower-power/Experiment

gnome-terminal -e ./bwc_parse.py 
gnome-terminal -e ./wlan0_parser.sh 
#gnome-terminal -e ./scp152.sh 

cd ~/MTX/SnmpPoller

sudo node server.js
