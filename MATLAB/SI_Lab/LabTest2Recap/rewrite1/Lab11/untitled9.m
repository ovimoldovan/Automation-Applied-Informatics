clear all;close all;
load('lab11cl_1.mat');
u = id.u;
y = id.y;

C = [1 1];
D = [0 0 0 1];

x = getX(id,C,D);



model2 = getIV2(id,2,2,rid');

compare(model2,val);

figure(3)
%%
%n = 2;
%na = n; nb = n;

mARX = arx(id, [3, 3, 1]); resid(mARX, id);

figure(4)
mOE = oe(id, [3, 3, 1]); resid(mOE, id);
