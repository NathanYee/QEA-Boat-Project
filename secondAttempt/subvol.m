function submergedVolume = subvol(n,theta,d)
% waterline only works for theta's between 0 and pi/2
%% define constants
vWater = 0; %volume of water displaced by given value of d

%% define equations of intercepts
hullIntFunc = @(y) hullFunc(y,n) - waterFunc(y,theta,d); %intersection of hull and waterline

%% find intercepts
y1 = fzero(hullIntFunc,-1); %first intersection of hull and waterline

if theta == 0
    y2 = 2;
end

if theta == pi
    y2 = -2;
end

if theta ~= 0    %check for angles that fzero does not like
    y2 = fzero(@(y) waterFunc(y,theta,d),-1);   %intersection of waterline and the y axis
end

y3 = fzero(hullIntFunc,1);  %second intersection of hull and waterline
%% do integrations for different cases of y1, y2, y3
dumbFunc = @(z,y) z./z; %needs two input arguments because ... matlab

if theta > pi/2
    if y2 <= -1
        vWater = integral2(dumbFunc,-1,1,@(y) hullFunc(y,n),0) - integral2(dumbFunc,y1,y3,@(y) hullFunc(y,n),@(y) waterFunc(y,theta,d));
    end
    
    if y2 > -1
        vWater = integral2(dumbFunc,y2,y3,@(y) waterFunc(y,theta,d),0) + integral2(dumbFunc,y3,1,@(y) hullFunc(y,n),0);
    end
else
    if y2 >= 1
       vWater = integral2(dumbFunc,y1,y3,@(y) hullFunc(y,n),@(y) waterFunc(y,theta,d)); 
    end

    if y2 < 1
        vWater = integral2(dumbFunc,y1,y2,@(y) hullFunc(y,n),@(y) waterFunc(y,theta,d)) + integral2(dumbFunc,y2,1,@(y) hullFunc(y,n),0);
    end
end
submergedVolume = vWater;
end
