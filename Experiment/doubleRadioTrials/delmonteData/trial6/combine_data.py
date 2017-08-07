#!/usr/bin/env python

distance_file = open('distance.txt', 'r+')

snmp_file = open('host2_log.txt', 'r+')

#signal_file = open('wlan0_output.txt', 'r+')

distance = distance_file.readlines()
snmp = snmp_file.readlines();
#signal = signal_file.readlines();

final_product = ""

for snmp_line in snmp:
    combine_line = ""
    snmp_time = int(snmp_line[0:6])
    print "snmp_time: " + str(snmp_time)
    for dist_line in distance:
        dist_time = int(dist_line[0:6])
        print "dist_time: " + str(dist_time)
        if dist_time == snmp_time:
            print "Match found with distance"
            #for sig_line in signal:

                #sig_time = int(sig_line[0:6])
		#print "sig_time: " + str(sig_time)
                #if sig_time == dist_time == snmp_time:
                    #print "Match found with signal"
            combine_line = dist_line[7:-1] + "," + snmp_line[22:-1]
            print combine_line
            final_product = final_product + combine_line + "\n"
    #break
    print "Next Loop"

output = open('data_set.txt', 'r+')

output.write(final_product)
