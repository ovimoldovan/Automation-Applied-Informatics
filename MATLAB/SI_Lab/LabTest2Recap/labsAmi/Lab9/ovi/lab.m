clear all;close all;
load('lab9_4.mat');
u = id.u;
y = id.y;

C = [1 1];
D = [0 0 0 1];
N = length(u);
nc = length(C) - 1;
nd = length(D) - 1;
theta = [C(2:end) D(2:end)]';

 %x = getX(C,D,u,theta);
 
 x = ValFunction(theta,u,nc,nd);
 na = 5;
 nb = 5;
 %model = getiv(id,nc,nd,C,D);
model=iv_computation(id,na,nb,x);
model12=arx(id,[na,nb,1]);
C1=model12.A;
D2=model12.B;
nc=length(C1)-1;
nd=length(D2)-1;
theta=[C1(2:end) D2(2:end)]';
X=ValFunction(theta,u,nc,nd);
model2=iv_computation(id,na,nb,X);
figure(1)
compare(model12,val,model12);