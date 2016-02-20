function visualization(n,mBoat,theta)
clf;

% define constants
d = waterline(mBoat,theta,n); %correct depth for given mass

% plot boat
y = linspace(-1,1,100);
z = abs(y).^n - 1;
plot(y,z,'k'), hold on
axis([-1 1 -1.25 .25])

% plot waterline
z = tand(theta)*y + d;
plot(y,z,'b'), hold on

% plot cob
COB = cob(theta,d,n);
plot(COB(1),COB(2),'*r'), hold on

% plot com
COM = com();
plot(COM(1),COM(2),'*k'), hold on

% print rightingArm
ra = rightingArm(theta,d,n);
ra_y = ra*cosd(theta);
ra_z = ra*sind(theta)+COM(2);
plot(ra_y, ra_z,'*g'), hold on
plot([COM(1) ra_y],[COM(2) ra_z],'g')
drawnow

end