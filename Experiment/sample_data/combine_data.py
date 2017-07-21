#!/usr/bin/env python

distance_file = open('distance.txt', 'r+')

snmp_file = open('host2_log.txt', 'r+')

signal_file = open('wlan0_output.txt', 'r+')

distance = distance_file.readlines()
snmp = snmp_file.readlines();
signal = signal_file.readlines();

final_product = ""

for snmp_line in snmp:
    combine_line = ""
    snmp_time = int(snmp_line[0:6])

    for dist_line in distance:
        dist_time = int(snmp_line[0:6])

        if dist_time == snmp_time:

            for sig_line in signal:

                sig_time = int(sig_line[0:6])

                if sig_time == dist_time == snmp_time:
                    combine_line = dist_line[7:-1] + "," + sig_line[7:-1] + "," + snmp_line[22:-1]
                    final_product = final_product + combine_line + "\n"

output = open('data_set.txt', 'r+')

output.write(final_product)
