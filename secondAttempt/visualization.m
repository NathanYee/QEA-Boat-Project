function visualization()
clf;
% define constants
n = 3;
mBoat = .2;
theta = pi/4;
d = waterline(mBoat,theta); %correct depth for given mass

% plot boat
y = linspace(-1,1,100);
z = abs(y).^n - 1;
plot(y,z,'k'), hold on
axis([-1 1 -1.25 .25])

% plot waterline
z = tand(theta)*y + d;
plot(y,z,'b'), hold on

end