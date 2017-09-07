
function [newpos,optimalStatus] = autoOptimal(distance,meanSNR,ComLink1pos,ComLink2pos,UAVpos)
N = [UAVpos(1,1),UAVpos(2,1)+1];
Nsnrs = getSNR(distance,meanSNR,ComLink1pos,N) + getSNR(distance,meanSNR,ComLink2pos,N); %this method of adding the SNRS might need to be changed.
NE = [UAVpos(1,1)+1,UAVpos(2,1)+1];
NEsnrs = getSNR(distance,meanSNR,ComLink1pos,NE) + getSNR(distance,meanSNR,ComLink2pos,NE);
NW = [UAVpos(1,1)-1,UAVpos(2,1)+1];
NWsnrs = getSNR(distance,meanSNR,ComLink1pos,NW) + getSNR(distance,meanSNR,ComLink2pos,NW);
S = [UAVpos(1,1),UAVpos(2,1)-1];
Ssnrs = getSNR(distance,meanSNR,ComLink1pos,S) + getSNR(distance,meanSNR,ComLink2pos,S);
SE = [UAVpos(1,1)+1,UAVpos(2,1)-1];
SEsnrs = getSNR(distance,meanSNR,ComLink1pos,SE) + getSNR(distance,meanSNR,ComLink2pos,SE);
SW = [UAVpos(1,1)-1,UAVpos(2,1)-1];
SWsnrs = getSNR(distance,meanSNR,ComLink1pos,SW) + getSNR(distance,meanSNR,ComLink2pos,SW);
E = [UAVpos(1,1)+1,UAVpos(2,1)];
Esnrs = getSNR(distance,meanSNR,ComLink1pos,E) + getSNR(distance,meanSNR,ComLink2pos,E);
W = [UAVpos(1,1)-1,UAVpos(2,1)];
Wsnrs = getSNR(distance,meanSNR,ComLink1pos,W) + getSNR(distance,meanSNR,ComLink2pos,W) ;
ComLink1Snr = getSNR(distance,meanSNR,ComLink1pos,UAVpos);
ComLink2Snr = getSNR(distance,meanSNR,ComLink2pos,UAVpos);
currentsnrs = ComLink1Snr + ComLink2Snr;

if Nsnrs >= currentsnrs
    newpos = N;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif NEsnrs >= currentsnrs
    newpos = NE;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif NWsnrs >= currentsnrs
    newpos = NW;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif Ssnrs >= currentsnrs
    newpos = S;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif SEsnrs >= currentsnrs
    newpos = SE;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif SWsnrs >= currentsnrs
    newpos = SW;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif Esnrs >= currentsnrs
    newpos = E;
    plot(UAVpos(1,1),UAVpos(2,1),'k.');
    optimalStatus = false;
elseif Wsnrs >= currentsnrs
   newpos = W;
   plot(UAVpos(1,1),UAVpos(2,1),'k.');
   optimalStatus = false;
else 
   newpos = UAVpos
   plot(UAVpos(1,1),UAVpos(2,1),'b*','MarkerSize',10);
   %optCount = optCount+1;
   optimalStatus = true;
   
end

end
%    %maximin problem
    %Checks 8 immediate square meters for highest SNR and moves in
    %direction of highest SNR
    %Output: Visual plot of drone moving to optimal position