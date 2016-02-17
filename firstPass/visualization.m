% visualizes boat and waterline

function visualization()
%% visualizes boat using globalhull
clf;
%% set domain
X = linspace(-1,1,100);
Y = linspace(-1,1,100);
%% create range (3D)
% Zboat = zeros(length(X),length(Y));
% 
% for i=1:length(Zboat)
%     for j=1:length(Zboat)
%         Zboat(i,j) = globalhull(X(j),Y(i),1);
%     end
% end
%% create range (2D)
Zboat2 = zeros(length(Y));

for i=1:length(Zboat2)
    Zboat2(i) = globalhull(0,Y(i),1);
end
%% plot surface of boat
%surf(X,Y,Zboat) %(3D)
plot(Y,Zboat2)
%% visualizes waterline for given mass and theta (now 2D)
% Zwaterline = zeros(1,length(X));
% theta = pi/6;
% d = waterline(.5,theta);
% for i=1:length(X)
%     Zwaterline(i) = tan(theta)*X(i) + d;
% end
% WaterlinePlane = zeros(length(Zwaterline),length(Zwaterline));
% 
% for i=1:length(WaterlinePlane)
%     WaterlinePlane(i,:) = Zwaterline(i);
% end
%% plot waterline
% hold on
% plot(Y,Zwaterline)
end