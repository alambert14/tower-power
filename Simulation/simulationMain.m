%Main/Uppermost Level Script for UAV simulation
load simulationMain.mat;
ComLink1pos = [1100;1100];
ComLink2pos = [1900;1900];
UAVpos = [1900;1000];

%optimalInfo = calcOptimal(distance,meanSNR,ComLink1pos,ComLink2pos)
optimalPosition = [1500;1500];

initWorld(distance,ComLink1pos,ComLink2pos,UAVpos);
plot(optimalPosition(1,1),optimalPosition(2,1),'b*');

    %while(status == false) %change to 0.1 later for Hz
    %[UAVpos,status] = autoOptimal(distance,meanSNR,ComLink1pos,ComLink2pos,UAVpos); 
    %end
    
dt = .1; %change in time
u = 75;%1.5; %approx 3 kts (forward velocity)
v = 0.0; %sideslip velocity
p_old = [UAVpos(2,1);UAVpos(1,1)]; %original position
optimalStatus = false;
while(optimalStatus == false)
    [optimalStatus,p_old,UAVpos,heading] = approachOptimal(optimalPosition,UAVpos,u,v,p_old,dt);
    pause on; %added pause to visually see what direction it was plotting
    pause(dt);
end

disp('Reached Optimal Position');
disp('stage 1 done');
disp('Initiating Orbiting Sequence')
hold on

psi = heading*pi/180; %psi in radians 
u = 75;
for t = 1:1:60%85
    %heading = calcHeading(optimalPosition,UAVpos)
    %Need to find out how to get last heading direction from previous for
    %loop
    roll = 9.; %Roll is 1 degree
    %yawRate = .04;
    yawRate = rollToYawRate(roll); %returns yaw rate IN RADIANS from roll
    psi = psi + yawRate;
    %in radians (roll)
    R = [cos(psi) sin(psi); -sin(psi) cos(psi)]; %2x2 rotational matrix. Outputs new positions based on clockwise heading
    v_b = [u;v]; %2x1 matrix
    p_new = dr(R,v_b,p_old,dt); %2x1 matrix
    % p_new = p_old + R*v_b;


    figure(1), plot(p_new(2),p_new(1),'b.');
    hold on
    convertp_new = [p_new(2,1);p_new(1,1)];

    
    p_old = p_new;
    UAVpos(2,1) = p_new(1,1);
    UAVpos(1,1) = p_new(2,1);
    pause on; %added pause to visually see what direction it was plotting
    pause(.1);

end

for t = 1:1:83
    %heading = calcHeading(optimalPosition,UAVpos)
    %Need to find out how to get last heading direction from previous for
    %loop
    roll = 8.45;
    yawRate = rollToYawRate(roll); %yaw rate = 0.26 radians/s need to find out how roll correlates to yaw in scan eagle.
    psi = psi + yawRate;
    %in radians (roll)
    R = [cos(psi) sin(psi); -sin(psi) cos(psi)]; %2x2 rotational matrix. Outputs new positions based on clockwise heading
    v_b = [u;v]; %2x1 matrix
    p_new = dr(R,v_b,p_old,dt); %2x1 matrix
    % p_new = p_old + R*v_b;


    figure(1), plot(p_new(2),p_new(1),'y.');
    hold on
    convertp_new = [p_new(2,1);p_new(1,1)];

    
    p_old = p_new;
    UAVpos(2,1) = p_new(1,1);
    UAVpos(1,1) = p_new(2,1);
    pause on; %added pause to visually see what direction it was plotting
    pause(.1);
end
disp('Initiating Optimal Orbit');
for t = 1:1:72
    %heading = calcHeading(optimalPosition,UAVpos)
    %Need to find out how to get last heading direction from previous for
    %loop
    roll = 10;
    yawRate = rollToYawRate(roll); 
    psi = psi + yawRate;
    %in radians (roll)
    R = [cos(psi) sin(psi); -sin(psi) cos(psi)]; %2x2 rotational matrix. Outputs new positions based on clockwise heading
    v_b = [u;v]; %2x1 matrix
    p_new = dr(R,v_b,p_old,dt); %2x1 matrix
    % p_new = p_old + R*v_b;


    figure(1), plot(p_new(2),p_new(1),'k.');
    hold on
    convertp_new = [p_new(2,1);p_new(1,1)];

    
    p_old = p_new;
    UAVpos(2,1) = p_new(1,1);
    UAVpos(1,1) = p_new(2,1);
    pause on; %added pause to visually see what direction it was plotting
    pause(.1);
end
disp('Orbiting Optimal Position');
disp('stage 2 done');