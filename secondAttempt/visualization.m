function visualization(mBoat,n)
clf;
% draws boat, waterline, centroids, and righitng arm in figure 1
% plots avs vs. mboat in figure 2

for i = -1:.1:0
    % find AVS for this mass
    theta = avs(mBoat,n,i);
    
    % define constants
    d = waterline(mBoat,theta,n); %correct depth for given mass
    
    % plot boat
    y = linspace(-1,1,100);
    z = abs(y).^n - 1;
    figure(1),plot(y,z,'k'), hold on
    axis([-1 1 -1.25 .25])
    
    % plot waterline
    z = tand(theta)*y + d;
    plot(y,z,'b'), hold on
    
    % plot cob
    COB = cob(theta,d,n);
    plot(COB(1),COB(2),'*r'), hold on
    
    % plot com
    COM = com(z)
    plot(COM(1),COM(2),'*k'), hold on
    
    % print rightingArm
    ra = rightingArm(mBoat,theta,n,i);
    ra_y = ra*cosd(theta);
    ra_z = ra*sind(theta)+COM(2);
    plot(ra_y, ra_z,'*g'), hold on
    plot([COM(1) ra_y],[COM(2) ra_z],'g')
    
    % plot avs vs mBoat
    figure(2),plot(i,theta,'*k'), hold on
    drawnow
end
end