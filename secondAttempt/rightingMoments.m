%visualize righting moments

scalingFactor = 2.54 * 5
thetas = linspace(50,179,35)
moments = []
for i=1:length(thetas)
    thetas(i)
    moments(i) = rightingArm(.2191,thetas(i),2,-0.6975)
end

plot(thetas,moments)