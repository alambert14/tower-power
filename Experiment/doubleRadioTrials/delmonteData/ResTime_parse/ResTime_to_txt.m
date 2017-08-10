fileID = fopen('/usr/local/MATLAB/R2017a/bin/7.28delmonte/ResTime_parse/ResTime_parse9.txt','w')
for i = 1:+1:46
    fprintf(fileID,'%f,%d\n',ResTime9(i,:))
end
