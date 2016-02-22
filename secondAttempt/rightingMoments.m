%visualize righting moments
%%
thetas1 = linspace(10,42,20);
moments1 = [];

for i=1:length(thetas1)
    moments1(i) = rightingArm(.2191,thetas1(i),2,-0.6975);
end

%%
thetas2 = linspace(50,179,40);
moments2 = [];

for i=1:length(thetas2)
    moments2(i) = rightingArm(.2191,thetas2(i),2,-0.6975);
end

%%
thetas = [thetas1, thetas2]
moments = [moments1, moments2]

plot(thetas, moments)
xlabel('Angle (degrees)')
ylabel('Moment N*m')