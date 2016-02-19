function res = waterline(mBoat,theta,n)

    netforce = @(d) subvol(theta,d,n) - mBoat;
    depth = fzero(netforce,0);
    res = depth;

end
