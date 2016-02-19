function visualization(n,mBoat)
clf;

for theta = 0:5:85
% define constants
d = waterline(mBoat,theta); %correct depth for given mass

% plot boat
y = linspace(-1,1,100);
z = abs(y).^n - 1;
plot(y,z,'k'), hold on
axis([-1 1 -1.25 .25])

% plot waterline
z = tand(theta)*y + d;
plot(y,z,'b'), hold on

% plot cob
[ycob,zcob] = cob(theta,d);
plot(ycob,zcob,'*r'), hold on
drawnow
end

end