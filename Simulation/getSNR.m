%Calculate the SNR based on the location of the comlink and position of the
%UAV.

%Input: Comlink x and y, UAV x and y
%   Function:
%   Based on the positions of UAV and ComLink, derives distance in between.
%   Inputs distance into polynomial function modeling mean SNR
%Output: SNR of link between specified antenna and UAV.

function output = getSNR(distance,meanSNR,ComLinkpos,UAVpos)

dist = sqrt((UAVpos(1,1)-ComLinkpos(1,1))^2 + (UAVpos(2,1)-ComLinkpos(2,1))^2); %distance from UAV to antenna 
f= fit(distance,meanSNR,'poly3','Normalize','on','Robust','Bisquare');
fitSnr = f(dist);
output = fitSnr;
end

