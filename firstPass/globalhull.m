function z_position = globalhull(x,y,params)
%% globalhull returns z_position for a point given a position in the xy plane and a variable paramemter
%% compute value of z
z = abs(y)^params + x^2 - 1;
%% if out of bounds, z=0;
if z > 0
    z = 0;
end
%% return z_position
z_position = z;
end