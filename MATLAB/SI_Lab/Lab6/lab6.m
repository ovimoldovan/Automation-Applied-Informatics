clear all;

load('lab6_2.mat')
u = id.u;
y = id.y;
na = 4;
nb = 4;

theta = thetaFunction(u,y,na,nb);

yhat = ValFunction(theta,u,na,nb);


figure(1)

plot(y);hold on; plot(yhat)
%% 

figure(2)

uval = val.u;
yval = val.y;



% using the old theta, recomputing the phi vector

yhatval = ValFunction(theta,uval,na,nb)

plot(yval);hold on;plot(yhatval)
%% 

model = arx(id, [2 2 1])

figure(3)
compare(model,val)

%%

Na = 1:15;
Nb = 1:15;
Nk = 1:5;
NN = struc(Na, Nb, Nk);
V = arxstruc(id, val, NN);

N = selstruc(V, 'plot');