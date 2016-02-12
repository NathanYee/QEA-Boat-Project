function z_position = globalhull(x,y,params)
%% globalhull returns z_position given a position in the xy plane and a variable paramemter
%% compute value of z
z = abs(y).^params - 1 + x.^2;
%% if out of bounds, z = 0
for i=1:length(z)
    for j=1:length(z)
        if z(i,j) > 0
            z(i,j) = 0;
        end
    end
end
%% return z_position
z_position = z;
end