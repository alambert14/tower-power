function h = calcHeading(optimalPos,pos)
difx = optimalPos(1,1) - pos(1,1);
dify = optimalPos(2,1) - pos(2,1);
angle = atan2(dify, difx);
angle = angle*180/pi;
h = mod((angle-90),360);
end
%Input: Optimal position (Must be known), UAV position
%Function: Utilizes atan2 and the difference btween optimal point and UAV
%point to calculate an angle for heading.
%Output: heading 0-360 degrees