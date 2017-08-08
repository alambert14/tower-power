fileID = fopen('/usr/local/MATLAB/R2017a/bin/7.28delmonte/SNR_parse/SNR_parse7.txt','w')
for i = 1:+1:180
    fprintf(fileID,'%f,%f\n',SNR7(i,:))
end
