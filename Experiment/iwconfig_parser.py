#!/usr/bin/env python

iwconf_file = open('iwcfg.txt', 'r+')

iwconf = iwconf_file.readlines()
iwconf_file.close()

link_quality = ""
signal = ""
for line in iwconf:
    if line.find("Link Quality") > -1:
        link_quality = line[23:25]
        signal = line[43:46]
        link_quality = str(float(link_quality)/70)
        print "Link Quality: " + link_quality
        print "Signal: " + signal

wlan0_output = open('wlan0_output.txt', 'a+')

wlan0_output.write(signal+","+link_quality+"\n")

