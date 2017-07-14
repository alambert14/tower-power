#!/usr/bin/env python

log_file = open('polling.txt', 'r+')

log = log_file.read()

delete_line = False

output = ""

for c in log:
    
    if "\n" in c: 
        delete_line = False
	print "Starting a new line!"
    if delete_line == False:
        if "*" in c:
            delete_line = True
        else:
            output = output+c

print output
           
