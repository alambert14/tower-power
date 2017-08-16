#!/usr/bin/env python


#FUNCTIONS NECESSARY BECAUSE OF DIFFERERENCES IN DISTANCE LENGTH
#function to return the distance from a line
def grab_distance(line):
    end_str = ""
    for ch in line:
        if ch != ',':
            end_str += ch
        elif ch == ',':
            return end_str
#function to return the SNR from a line
def grab_snr(line):
    end_str = ""
    start_snr = False
    for ch in line:
        if start_snr:
            if ch != "\n":
                end_str += ch
	if ch == ',':
            start_snr = True
    return end_str

    

file1 = open('SNR_parse1.txt','r+')
file2 = open('SNR_parse2.txt','r+')
file3 = open('SNR_parse3.txt','r+')
file4 = open('SNR_parse4.txt','r+')
file5 = open('SNR_parse5.txt','r+')
file6 = open('SNR_parse6.txt','r+')
file7 = open('SNR_parse7.txt','r+')
file8 = open('SNR_parse8.txt','r+')
file9 = open('SNR_parse9.txt','r+')
file10 = open('SNR_parse10.txt','r+')

file_array = [file1,file2,file3,file4,file5,file6,file7,file8,file9,file10]

#CODE TO MATCH DISTANCES
all_matches = []
#iterate through each file
for i, trial_file in enumerate(file_array):
    #each file becomes an array of each line
    trial_file.seek(0)
    orig_trial = trial_file.readlines()
    #print "Starting file " + str(i)
    for line in orig_trial:
	#print "starting line loop"
        #grab the distance from the current line
        orig_dist = grab_distance(line)
        #print "Distance: " + orig_dist
        #checks for first match so distance is only printed once
        first_match = True
        current_line = ""
        #iterate through the next files to find a match (or more)
        for j, comp_file_next in enumerate(file_array):
            #only checks if the file is after the current one
            if j > i:
                comp_file_next.seek(0)
                comp_trial = comp_file_next.readlines()
                for line2 in comp_trial:
                    comp_dist = grab_distance(line2)
                    if orig_dist == comp_dist:
                        #print "Match found! Files " + str(i) + ", " + str(j)
                        #if this is the first match, add the distance and the matched SNRs to the line
                        if first_match == True:
                            current_line = orig_dist + "," + grab_snr(line) + "," + grab_snr(line2)
                            first_match = False
                        else:
                            current_line = current_line + "," + grab_snr(line2)
        #print current_line
        all_matches.append(current_line + "\n")   
		
#CODE TO REMOVE DUPLICATES
hit_list = []
final_list = []
#trial for whether or not to delete line
#returns false to remove
#returns true to keep
def check_to_kill(suspect,hit_list):
    to_kill = False
    for distance in hit_list:
        if get_distance(suspect) == distance:
            to_kill = True
            return to_kill
    return to_kill
    
first_time = True
for match in all_matches:
    if match != "\n":
        if first_time:
            hit_list.append(match)
            final_list.append(match)
        else:
            kill = check_to_kill(match)
            if not kill:
                final_list.append(match)

print final_list
write_file = open('distances_matched_snr.txt','w+')

for line in final_list:
    write_file.write(line)


