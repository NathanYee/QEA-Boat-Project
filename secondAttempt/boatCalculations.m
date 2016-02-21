%real life dimensions
d = -.8; %d is the depth for the waterline
n = 2; %degree of polynomial

mast = 92
cans = 389.5
ballast = 300


mass = mast + 2*cans + ballast
scale = 5
theta = 0; %angle of waterline
crossArea = subvol(theta,d,n)
dimCrossArea = crossArea * 2.54^2 * scale^2
length = mass/dimCrossArea

%calculate com
z = (mast*(25-scale*2.54) - 2*cans*4.5 - ballast*(scale+1)*2.54) / (mass * scale * 2.54)

AVS = avs(crossArea,n,z)