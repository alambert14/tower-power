fileID = fopen('/usr/local/MATLAB/R2017a/bin/7.28delmonte/ThroughOut_parse/ThroughOut_parse9.txt','w')
for i = 1:+1:46
    fprintf(fileID,'%f,%d\n',ThroughOut9(i,:))
end
