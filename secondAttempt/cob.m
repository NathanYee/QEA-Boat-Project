function [ycob,zcob] = cob(theta,d)
% waterline only works for theta's between 0 and pi/2
%% define constants
ycob = 0;
zcob = 0;
%% define functions for shape of hull and the waterline
hullFunc = @(y) y.^10 - 1;
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
yFunc = @(y,z) y;
zFunc = @(y,z) z;
if theta > 90
    if y2 <= -1
        vWater = integral2(dumbFunc,-1,1,hullFunc,0) - integral2(dumbFunc,y1,y3,hullFunc,waterFunc);
        ycob = (integral2(yFunc,-1,1,hullFunc,0) - integral2(yFunc,y1,y3,hullFunc,waterFunc))/vWater;
        zcob = (integral2(zFunc,-1,1,hullFunc,0) - integral2(zFunc,y1,y3,hullFunc,waterFunc))/vWater;
    end
    
    if y2 > -1
        vWater = integral2(dumbFunc,y2,y3,waterFunc,0) + integral2(dumbFunc,y3,1,hullFunc,0);
        ycob = (integral2(yFunc,y2,y3,waterFunc,0) + integral2(yFunc,y3,1,hullFunc,0))/vWater;
        zcob = (integral2(zFunc,y2,y3,waterFunc,0) + integral2(zFunc,y3,1,hullFunc,0))/vWater;
    end
else
    if y2 >= 1
       vWater = integral2(dumbFunc,y1,y3,hullFunc,waterFunc); 
       ycob = (integral2(yFunc,y1,y3,hullFunc,waterFunc))/vWater;
       zcob = (integral2(zFunc,y1,y3,hullFunc,waterFunc))/vWater;
    end

    if y2 < 1
        vWater = integral2(dumbFunc,y1,y2,hullFunc,waterFunc) + integral2(dumbFunc,y2,1,hullFunc,0);
        ycob = (integral2(yFunc,y1,y2,hullFunc,waterFunc) + integral2(yFunc,y2,1,hullFunc,0))/vWater;
        zcob = (integral2(zFunc,y1,y2,hullFunc,waterFunc) + integral2(zFunc,y2,1,hullFunc,0))/vWater;
    end
end
end
