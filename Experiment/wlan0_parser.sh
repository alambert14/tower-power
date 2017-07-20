#!/bin/bash
while true
do
	iwconfig > iwcfg.txt
	date +%H%M%S | tr '\n' ','  >> wlan0_output.txt
	./iwconfig_parser.py
	sleep 1
done
