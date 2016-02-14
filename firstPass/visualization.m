% visualizes boat and waterline

function visualization()
%% visualizes boat using globalhull
%% set domain
X = linspace(-1,1,100);
Y = linspace(-1,1,100);
%% create range
Zboat = zeros(length(X),length(Y));

for i=1:length(Zboat)
    for j=1:length(Zboat)
        Zboat(i,j) = globalhull(X(j),Y(i),1);
    end
end
%% plot surface of boat
surf(X,Y,Zboat)
%% visualizes waterline for given mass and theta
Zwaterline = waterline(1,pi/4,X); % vector of values for W
WaterlinePlane = zeros(length(Zwaterline),length(Zwaterline));

for i=1:length(WaterlinePlane)
    WaterlinePlane(i,:) = Zwaterline(i);
end
%% plot waterline
hold on
surf(X,Y,WaterlinePlane)
end