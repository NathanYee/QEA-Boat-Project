function visualization(n,mBoat)
clf;

for theta = 45:10:45
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
rightingArm = rightingArm(theta,d,n);

drawnow
end

end