fileID = fopen('/usr/local/MATLAB/R2017a/bin/7.28delmonte/ThroughIn_parse/ThroughIn_parse6.txt','w')
for i = 1:+1:80
    fprintf(fileID,'%f,%d\n',ThroughIn6(i,:))
end
