[x,y] = meshgrid(-pi:0.01:pi);
contour(x,y,sin(x) + cos(y) - sin(y))