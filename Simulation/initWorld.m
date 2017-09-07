%function sets up a local 2D world grid and initializes positions of the
%two comlinks and UAV.

%Input: Distance variable, int location of ComLink1, ComLink2, UAV drone.
%Output: A visible representation of the signal fields of both antennas,
%and the position of the UAV.

function iw = initWorld(distance,ComLink1pos,ComLink2pos,UAVpos) %add meanSNR to parameters for method 2

%plotting grid
world = zeros(3000,3000);
%world(1,1) = 1

plot(world, 'k');

hold on
%grid on
%set(gca,'xtick',[0:1:100])
%set(gca,'ytick',[0:1:100])
% above sets up a grid for better visible representation.

%initializing position of two antennas with incremented circular field

    %Method 1: Bringing nodes close together
%ComLink1 Init
    %Properties:
    %ComLink 1 at location (1000m,1000m)
    %Signal radius: 1,039.0m
    %Signal field increments: 200m    
%ComLink1x = 1000; %arbitrary units
%ComLink1y = 1000;

radius1 = distance(length(distance(:,1)));
%uncomment following for method 2: Modeling signal field after third degree 
%polynomial best fit.

    %antennaField1 = fit(distance,meanSNR,'poly3');
    %radius1 = fzero(antennaField1,[1000,2000]);
theta = linspace(0,2*pi);
x1 = radius1*cos(theta) + ComLink1pos(1,1);
y1 = radius1*sin(theta) + ComLink1pos(2,1);
plot(x1,y1,'k');
axis equal;
b = 1;
r = 1;
g = 1;

for c = radius1:-200:0
    xc = c*cos(theta) + ComLink1pos(1,1);
    yc = c*sin(theta) + ComLink1pos(2,1);
    b = b - .15;
    g = g - .15;
    
    fill(xc,yc,[r b g]);
    plot(xc,yc,'k');
end
plot(ComLink1pos(1,1),ComLink1pos(2,1),'k.','MarkerSize',15);

%ComLink2 Init
    %Properties:
    %ComLink 2 at location (2000m,2000m)
    %Signal radius: 1,039.0m
    %Signal field increments: 200m
%ComLink2x = 2000;
%ComLink2y = 2000;
radius2 = distance(length(distance(:,1)));
%uncomment following for method 2: Modeling signal field after third degree 
%polynomial best fit.
    %antennaField2 = fit(distance,meanSNR,'poly3');
    %radius2 = fzero(antennaField2,[1000,2000]);
x2 = radius2*cos(theta) + ComLink2pos(1,1);
y2 = radius2*sin(theta) + ComLink2pos(2,1);
plot(x2,y2,'k');
axis equal;
for c = radius2:-200:0
    xc = c*cos(theta) + ComLink2pos(1,1);
    yc = c*sin(theta) + ComLink2pos(2,1);
    %b = b - .1;
    %g = g - .1;
    %fill(xc,yc,[r b g]);
    plot(xc,yc,'k');
end
plot(ComLink2pos(1,1),ComLink2pos(2,1),'k.','MarkerSize',15);
%UAV Init

plot(UAVpos(1,1),UAVpos(2,1),'k*');

xlim([0 2999]);
ylim([0 2999]);
iw = 0; %what to do if you don't want to return
end