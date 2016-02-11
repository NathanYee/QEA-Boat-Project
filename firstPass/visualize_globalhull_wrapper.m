[X,Y] = meshgrid(-2:.1:2,-2:.1:2);
Z = globalhull(X,Y,3);
surf(X,Y,Z)