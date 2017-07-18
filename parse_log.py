#!/usr/bin/env python

log_file = open('polling_logs/pollingLog1.txt', 'r+')

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



#print output1
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
           

#print output2

outputfile1 = open('outputfile1.txt', 'r+')

outputfile1.write(output2)

outputfile1.close()

outputfile2 = open('outputfile1.txt', 'r+')

output2 = outputfile2.readlines()

#print output2
host1 = ""
host2 = ""

count = 0
even = True

for line in output2:
    if ".151" in line:
        host1 = host1+line
    elif ".152" in line:
        host2 = host2+line

outputfile2.close()
#    if even == True:
#        host1 = host1+c
#    else:
#        host2 = host2+c
#    if "\n" in c:
#        even = not even
        
host1_file = open('host1_log.txt', 'r+')
host2_file = open('host2_log.txt', 'r+')

host1_file.write(host1)
host2_file.write(host2)

host1_file.close()
host2_file.close()

print host1
print host2 
