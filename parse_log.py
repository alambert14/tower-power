#!/usr/bin/env python

log_file = open('polling.txt', 'r+')

log = log_file.read()

delete_line = False

output1 = ""

for c in log:
    
    if "\n" in c: 
        delete_line = False

    if delete_line == False:
        if "*" in c:
            delete_line = True
        else:
            output1 = output1+c



print output1
output2 = ""
delete_date = False

for c in output1:
    if " " in c:
       if delete_date == True:
	   delete_date = False
       else:
           output2 = output2+","

    else:
        if delete_date == False:
            if "\n" in c:
	        delete_date = True
	    output2 = output2+c    
           

print output2

host1 = ""
host2 = ""

count = 0
even = True

for c in output2:
    if even == True:
        host1 = host1+c
    else:
        host2 = host2+c
    if "\n" in c:
        even = not even
        

print host1
print host2 
