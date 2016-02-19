function submergedVolume = subvol(theta,d,n)
% waterline only works for theta's between 0 and pi/2
%% define constants
vWater = 0; %volume of water displaced by given value of d
%% define functions for shape of hull and the waterline
hullFunc = @(y) hull(y,n);
waterFunc = @(y) tand(theta)*y + d;

%% define equations of intercepts
hullIntFunc = @(y) hullFunc(y) - waterFunc(y); %intersection of hull and waterline

%% find intercepts
y1 = fzero(hullIntFunc,-1); %first intersection of hull and waterline
if theta == 0
    y2 = 2;
end

if theta == 180
    y2 = -2;
end

if theta ~= 0    %check for angles that fzero does not like
    y2 = fzero(waterFunc,-1);   %intersection of waterline and the y axis
end

y3 = fzero(hullIntFunc,1);  %second intersection of hull and waterline
%% do integrations for different cases of y1, y2, y3
dumbFunc = @(z,y) z./z; %needs two input arguments because ... matlab

if theta > 90
    if y2 <= -1
        vWater = integral2(dumbFunc,-1,1,hullFunc,0) - integral2(dumbFunc,y1,y3,hullFunc,waterFunc);
    end
    
    if y2 > -1
        vWater = integral2(dumbFunc,y2,y3,waterFunc,0) + integral2(dumbFunc,y3,1,hullFunc,0);
    end
else
    if y2 >= 1
       vWater = integral2(dumbFunc,y1,y3,hullFunc,waterFunc); 
    end

    if y2 < 1
        vWater = integral2(dumbFunc,y1,y2,hullFunc,waterFunc) + integral2(dumbFunc,y2,1,hullFunc,0);
    end
end
submergedVolume = vWater;
end
