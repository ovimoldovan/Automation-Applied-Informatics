clear all;close all;
load('lab11cl_3.mat')
uid = id.u;
uval = val.u;
yid = id.y;
yval = val.y;

rid = rid';

na = 2;
nb = 2;
% lab 9 code
C = [1 1];
D = [0 0 0 1];
N = length(uid);
nc = length(C) - 1;
nd = length(D) - 1;
theta = [C(2:end) D(2:end)]';
 x = ValFunction(theta,uid,nc,nd);

model = getIV(id,na,nb,x);
figure(1)
compare(model,val)

%% 
figure(2)
model2 = getIV2(id,na,nb,rid);
compare(model2, val)

%% part 2

load('lab11mv_3.mat')

figure(3)

%n = 2;
na = n; nb = n;

mARX = arx(id, [n, n, 1]); resid(mARX, id);

figure(4)
mOE = oe(id, [n, n, 1]); resid(mOE, id);


