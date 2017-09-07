function heading = calcOptimal(distance,meanSNR,ComLink1pos,ComLink2pos)
highPos = [];
highSnr = 0; %not sure if initializing to 0 is a good choice
for r = 1000:1:2000
    for c = 1000:1:2000
        tempPos = [r,c];
        tempSnr = getSNR(distance,meanSNR,ComLink1pos,tempPos) + getSNR(distance,meanSNR,ComLink2pos,tempPos);
        if tempSnr >= highSnr
            highPos = tempPos;
            highSnr = tempSnr;
            
        end
    end
end

optimalPos = [highPos(1,1),highPos(2,1),highSnr]; 


heading = optimalPos;
end
%Input: Distance and meanSNR variables, antenna positions
%Function: Searches a space of 1000x1000 in the middle ofthe world for the
%maximum additive SNR.
%Output: Highest SNR and it's position.
