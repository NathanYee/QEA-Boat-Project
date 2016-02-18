function res = waterline(mBoat,theta)

    netforce = @(d) subvol(theta,d) - mBoat;
    depth = fzero(netforce,0);
    res = depth;

end
