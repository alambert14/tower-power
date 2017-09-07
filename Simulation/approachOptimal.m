function [oS,p_old,UAVpos,heading] = approachOptimal(optimalPosition,UAVpos,u,v,p_old,dt)
heading = calcHeading(optimalPosition,UAVpos)
distanceTo = sqrt((UAVpos(1,1)-optimalPosition(1,1))^2 + (UAVpos(2,1)-optimalPosition(2,1))^2)
psi = heading*pi/180; %in radians (Yaw)
R = [cos(psi) sin(psi); -sin(psi) cos(psi)]; %2x2 rotational matrix. Outputs new positions based on clockwise heading
v_b = [u;v]; %2x1 matrix
p_new = dr(R,v_b,p_old,dt); %2x1 matrix
% p_new = p_old + R*v_b;


figure(1), plot(p_new(2),p_new(1),'g.');
hold on
convertp_new = [p_new(2,1);p_new(1,1)];

switchPoint = round(mod(calcHeading(optimalPosition,convertp_new) - calcHeading(optimalPosition,UAVpos),360),0);
if  switchPoint == 180
    oS = true;
else
    oS = false;
end

p_old = p_new;
UAVpos(2,1) = p_new(1,1);
UAVpos(1,1) = p_new(2,1);
end