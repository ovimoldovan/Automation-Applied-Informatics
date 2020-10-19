clear all;
load('lab3_01.mat')
Xid = id.X
Yid = id.Y
plot(Xid,Yid,val.X,val.Y)

n = 5; %number of gbf
N = length(id.X);
t=1:N;
xmin = id.X(1)
xmax = id.X(N)

domain = xmax-xmin

distance = domain / (n-1);
b = distance
c = xmin:distance:xmax;

for k=1:N
    for j=1:n
        phi(k,j) = exp(-((Xid(k)-c(j))^2)/(b^2));
    end
end

figure(2);
%plot(phi)

theta = phi\(Yid)';

yhat = phi * theta;

plot(Xid,Yid,Xid,yhat)

Xval = val.X;
Yval = val.Y;
N = length(Xval)
for k=1:N
    for j=1:n
        phi2(k,j) = exp(-((Xval(k)-c(j))^2)/(b^2));
    end
end

yhat2 = phi2 * theta
figure(3)
plot(Xval,Yval,Xval,yhat2)