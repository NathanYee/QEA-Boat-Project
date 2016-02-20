function visualization()
clf;
<<<<<<< HEAD
=======

for theta = 45:10:45
>>>>>>> 7a32f182c4c1f121844eea0d68e5ba05602d3f60
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
COB = cob(theta,d,n);
plot(COB(1),COB(2),'*r'), hold on

% plot com
COM = com();
plot(COM(1),COM(2),'*k'), hold on

% print rightingArm
rightingArm = rightingArm(theta,d,n);

drawnow
end

>>>>>>> ae917783689d18edfb5104810569860abe53dc6a
end