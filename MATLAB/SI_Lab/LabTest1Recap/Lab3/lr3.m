close all;
clear all;
load('lab3_01.mat')

x = id.X;
y = id.Y;
plot(x,y)

N = length(x)
n = 10; %number of gbf
xmin = x(1);
xmax = x(length(x));
domain = xmax - xmin;
distance = domain / (n-1);
c = xmin:distance:xmax;
b = distance;

for i=1:N
    for j=1:n
        phi(i,j) = exp(-(x(i)-c(j))^2/b^2);
    end
end

theta = phi\y';


xval = val.X;yval = val.Y;
N=length(xval);
for i=1:N
    for j=1:n
        phi2(i,j) = exp(-(xval(i)-c(j))^2/b^2);
    end
end

yhat = phi2*theta;
figure(2)

plot(xval,yval,xval,yhat)