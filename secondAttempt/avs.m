function res = avs(mBoat,n)
%avs fzero's to find the avs.  This is the angle at which our boat becomes
%unstable
res = fzero(@(theta) rightingArm(mBoat,theta,n), 115);

end