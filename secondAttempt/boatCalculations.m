%real life dimensions
d = -.7; %d is the depth for the waterline
n = 2; %degree of polynomial

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
z = (mast*(25-scale*2.54) - 2*cans*(scale*2.54 - 3.8) - ballast*(scale+1)*2.54) / (mass * scale * 2.54)

AVS = avs(crossArea,n,z)