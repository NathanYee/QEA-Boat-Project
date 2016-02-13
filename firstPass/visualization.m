function visualization()
%% visualizes boat using globalhull
%% set domain
X = linspace(-1,1,100);
Y = linspace(-1,1,100);
%% create range
Z = zeros(length(X),length(Y));

for i=1:length(Z)
    for j=1:length(Z)
        Z(i,j) = globalhull(X(j),Y(i),1);
    end
end
%% plot surface of boat
surf(X,Y,Z)
end