clear all;

load('lab6_2.mat')
u = id.u;
y = id.y;
na = 2;
nb = 2;

[theta, phi] = thetaFunction(u,y,na,nb);

Y = phi * theta;

t = 0:length(u);
plot(y);hold on; plot(Y)

figure(2)

uval = val.u;
yval = val.y;

[thetaval, phival] = thetaFunction(uval,yval,na,nb);

% using the old theta, just recomputing the phi vector

Yval = phival*theta

plot(yval);hold on;plot(Yval)


model = arx(id, [2 2 1])

figure(3)
compare(model,val)