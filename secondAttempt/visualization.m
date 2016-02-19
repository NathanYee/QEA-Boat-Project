function visualization()
clf;
% define constants
<<<<<<< HEAD
n = 10;
mBoat = .25;
theta = 60;
d = waterline(mBoat,theta); %correct depth for given mass
=======
d = waterline(mBoat,theta,n); %correct depth for given mass
>>>>>>> ae917783689d18edfb5104810569860abe53dc6a

% plot boat
y = linspace(-1,1,100);
z = abs(y).^n - 1;
plot(y,z,'k'), hold on
axis([-1 1 -1.25 .25])

% plot waterline
z = tand(theta)*y + d;
plot(y,z,'b'), hold on

<<<<<<< HEAD
=======
% plot cob
[ycob,zcob] = cob(theta,d,n);
plot(ycob,zcob,'*r'), hold on
drawnow
end

>>>>>>> ae917783689d18edfb5104810569860abe53dc6a
end