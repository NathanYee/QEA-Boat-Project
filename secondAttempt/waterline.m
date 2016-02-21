function res = waterline(mBoat,theta,n)

    netforce = @(d) subvol(theta,d,n) - mBoat;
    depth = fzero(netforce,-1);
    res = depth;

end
