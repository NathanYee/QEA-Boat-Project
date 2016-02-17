% currently 2D
% pi/2 is going to do weird things.
% the problem lies in comparing vWater against vDis. Pretty sure the
% integration is working properly.

function depth = waterline(mBoat,theta)
%% waterline will return a plottable vector of position values for the waterline by
%the distance below y=0

%% define constants
pWater = 1; % g/cm^3
vDis = mBoat/pWater; %volume water displaced (m^3)
vWater = 0; %volume of water displaced given by d
d = -.9; %depth of waterline from hull
%% Function for shape of boat
%funXZ = 1; %will use this later in 3d version
funcYZ = @(y) y^10 - 1;
%% Function for waterline based on d
funcWater = @(y,d) tan(theta)*y+d;
%% check things for value of d
step = 1/100; %checks 100 times
check = realmax;
w = 0; % variable to hold correct value of d
while d <= 0
    % Find intercepts
    %%
    funcWater = @(y) tan(theta)*y+d;
    hullfunc = @(a) funcYZ(a) - funcWater(a); % waterline and boat hull
    y0func = @(b) funcWater(b); % waterline and y axis
    y1 = fzero(hullfunc,-1);
    if theta ~= pi && theta ~= 0
        y2 = fzero(y0func,-1);
    end
    y3 = fzero(hullfunc,1);
    keyboard
    % Find vWater for current d
    %%
    doublefunc = @(y,z) z./z; %some shit for integral2
    if theta == pi || theta == 0
        % Weird case #1: theta = pi
        vWater = integral2(doublefunc,y1,y3,funcYZ,d); 
    elseif y1 ~= y3 && y2 > y3
        %Case 2: waterline intercepts hull twice
        vWater = integral2(doublefunc,y1,y3,funcYZ,funcWater);
    else
        %Case 1: waterline intercepts deck (y axis)
        vWater = integral2(doublefunc,y1,y2,funcYZ,funcWater)-integral(funcYZ,y2,1);
    end
    %%
    % Compare vWater againts vDis
    if abs(vDis-vWater) <= check
        w = d;
        check = abs(vDis-vWater);
    end
    %%
    d = d + step;
end
%% Final result: matrix of z values for waterline
depth = w;
end
