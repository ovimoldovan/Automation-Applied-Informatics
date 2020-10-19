clear all;
close all;
load('lab3_01.mat');
x = id.X;
y = id.Y;



n = 10;
N = length(x);

xmin = x(1);xmax = x(N);

domain = xmax - xmin;
distance = domain/(n-1);
c = xmin:distance:xmax;

b = distance;

for i=1:N
    for j=1:n
        phi(i,j) = exp(-(x(i)-c(j))^2/b^2);
    end
end

theta = phi\y';

xval = val.X;
yval = val.Y;

N2 = length(xval)
for i=1:N2
    for j=1:n
        phi2(i,j) = exp(-(xval(i)-c(j))^2/b^2);
    end
end

ysim = phi2*theta;

plot(xval,yval,xval,ysim)