% currently 2D
% pi/2 is going to do weird things.
% the problem lies in comparing vWater against vDis. Pretty sure the
% integration is working properly.

function Waterline = waterline(mBoat,theta,X)
%% waterline will return a plottable vector of position values for the waterline by
%the distance below y=0

%% define constants
pWater = 1; % g/cm^3
vDis = mBoat/pWater; %volume water displaced (m^3)
vWater = 0; %volume of water displaced given by d
d = -1; %depth of waterline from hull
bottomboat = -1; % bottom of boat
%% Function for shape of boat
%funXZ = 1; %will use this later in 3d version
funYZ = @(y) abs(y).^1 - 1;
%% Function for waterline based on d
funWater = @(y) tan(theta)*y+d;
%% check things for value of d
step = bottomboat/100; %checks 100 times
check = realmax;
w = 0; % variable to hold correct value of d
while d < 0
    % Find intercepts
    %%
    step = -1/100;
    vDis = 1;
    check = vDis;
    theta = pi;
    d = -.01;
    funYZ = @(y) abs(y).^1 - 1;
    funWater = @(y) tan(theta)*y+d;
    hullfun = @(a) funYZ(a) - funWater(a); % waterline and boat hull
    y0fun = @(b) funWater(b); % waterline and y axis
    y1 = fzero(hullfun,-1);
    y2 = fzero(y0fun,-1);
    y3 = fzero(hullfun,1);
    
    % Find vWater for current d
    doublefun = @(y,z) z./z;
    if y3+y1 < .0001
        % Weird case: theta = pi
        vWater = integral2(doublefun,y1,y3,-1,d);
    elseif y1 ~= y3 && y2 > y3
        % Case 1: waterline intercepts hull twice
        vWater = integral2(doublefun,y1,y3,funYZ,funWater);
    elseif y1 < y2 < y3
        % Case 2: waterline intercepts deck (y axis)
        vWater = integral2(doublefun,y1,y2,funYZ,funWater)-integral(funYZ,y2,1);
    end
    
    % Compare vWater againts vDis
    if abs(vDis-vWater) <= check
        lastvWater = vWater;
        w = d;
        check = abs(vDis-vWater);
    end
    %%
    d = d - step;
end

%% Final result: matrix of z values for waterline
W = zeros(1,length(X));
for i=1:length(X)
    W(i) = tan(theta)*X(i) + w;
end
Waterline = W;
% some random shit it prints
depth = w
thingthatshouldbe0 = check
lastvWater1 = lastvWater
end
