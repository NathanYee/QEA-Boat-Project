function res = rightingArm(theta,d,n)
% takes position of COM and COB and unit vector of waterline and gives
% righitng arm

cob_vec = cob(theta,d,n); %returns [ycob,zcob]
com_vec = com(); %returns [ycom,zcom]
r = cob_vec-com_vec;
unit_water = [cosd(theta),sind(theta)];
rightingarm = dot(r,unit_water);

res = rightingarm;
end