#!/usr/bin/env python

__author__ = 'Amal G Jose'

import time
import serial
import string
import pynmea
from pynmea import nmea


ser = serial.Serial()
ser.port = "/dev/ttyUSB0"
ser.baudrate = 4800
ser.timeout = 1
ser.open()
gpbwc = nmea.GPBWC()
while True:
    data = ser.readline()
    if data[0:6] == '$GPBWC':
        ##method for parsing the sentence
        gpbwc.parse(data)
        lats = gpbwc.lat_next
        print "Latitude values : " + str(lats)

        lat_dir = gpbwc.lat_next_direction
        print "Latitude direction : " + str(lat_dir)

        longitude = gpbwc.lon_next
        print "Longitude values : " + str(longitude)

        long_dir = gpbwc.lon_next_direction
        print "Longitude direction : " + str(long_dir)

        time_stamp = gpbwc.timestamp
        print "GPS time stamp : " + str(time_stamp)

        way_range = gpbwc.range_next
	print "Distance to Waypoint : " + str(way_range)

	way_range_meters = float(way_range)*1852
	print "Distance in Meters : " + str(way_range_meters)

	

        lat_deg = lats[0:2]
        lat_mins = lats[2:4]
        lat_secs = round(float(lats[5:])*60/10000, 2)

        latitude_string = lat_deg+ ' ' + lat_mins + string.printable[68] + str(lat_secs) + string.printable[63]
        print "Latitude : " + str(latitude_string)

        lon_deg = longitude[0:3]
        lon_mins = longitude[3:5]
        lon_secs = round(float(longitude[6:])*60/10000, 2)
        lon_str = lon_deg + ' ' + lon_mins + string.printable[68] + str(lon_secs) + string.printable[63]
        print "Longitude : " + str(lon_str)

	output_file = open('distance.txt', 'a+')
	output_file.write(time_stamp+","+str(way_range_meters)+"\n")
	output_file.close()
