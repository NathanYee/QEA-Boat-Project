%real life dimensions
<<<<<<< HEAD
d = -1.5; %d is the depth for the waterline
n = 4; %degree of polynomial
=======
d = -.7; %d is the depth for the waterline
n = 2; %degree of polynomial
>>>>>>> b556e07ecbc06f50b47696f9b748679853abe604

mast = 92;
cans = 389.5; %rootbeer
ballast = 300;


mass = mast + 2*cans + ballast
scale = 5;
theta = 0; %angle of waterline
crossArea = subvol(theta,d,n)
dimCrossArea = crossArea * 2.54^2 * scale^2
length = mass/dimCrossArea

thicknessNextToHull = .5 - (3.3 /(2.54 * scale))^2 %.5 is distance form bottom, 3.3 is radius of can,

%calculate com
<<<<<<< HEAD
z = (mast*(25-scale*2.54) - 2*cans*9 - ballast*(scale+1)*2.54) / (mass * scale * 2.54)
=======
z = (mast*(25-scale*2.54) - 2*cans*(scale*2.54 - 3.8) - ballast*(scale+1)*2.54) / (mass * scale * 2.54)

>>>>>>> b556e07ecbc06f50b47696f9b748679853abe604
AVS = avs(crossArea,n,z)