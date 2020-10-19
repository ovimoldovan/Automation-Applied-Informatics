clear all;
close all;
load('lab6_1.mat')
plot(val)
u = id.u;
y = id.y;

N = length(u);
na = 4;
nb = 4;

for i=1:N
    for j=1:na
        if i-j>0
            phi1(i,j) = -y(i-j);
        else 
            phi1(i,j) = 0;
        end
    end
    for j=1:nb
        if i-j>0
            phi2(i,j) = u(i-j);
        else
            phi2(i,j) = 0;
        end
    end
end

phi = horzcat(phi1,phi2);

theta = phi\y;

yhat = phi * theta;
figure(3)
plot(y);hold on; plot(yhat)

yval = val.y; xval = val.u;


N = length(xval)
ysim = [];

for i=1:N
    for j=1:na
        if i-j>0
            phi1(i,j) = -yval(i-j);
        else 
            phi1(i,j) = 0;
        end
    end
    for j=1:nb
        if i-j>0
            phi2(i,j) = xval(i-j);
        else
            phi2(i,j) = 0;
        end
    end
    phi = horzcat(phi1, phi2);
    ysim(i,:) = phi(i,:) * theta;
end
figure(2)

plot(yval);hold on;plot(ysim)

mse = sum((yval-ysim).^2)/N

