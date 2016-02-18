function visualization()
clf;
% define constants
n = 10;
mBoat = .5;
theta = 45;
d = waterline(mBoat,theta); %correct depth for given mass

% plot boat
y = linspace(-1,1,100);
z = abs(y).^n - 1;
plot(y,z,'k'), hold on
axis([-1 1 -1.25 .25])

% plot waterline
z = tan(theta)*y + d;
plot(y,z,'b'), hold on

end