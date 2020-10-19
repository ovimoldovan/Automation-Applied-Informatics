clear all; close all;
load('lab9_1.mat');
na = n; nb = n;
u = id.u;
y = id.y;

arx = arx(id, [na, nb, 1]);

C = arx.A; D = arx.B;

model = iv(id, [na, nb, 1], C, D);

compare(model, val)
%%

%C = [1 1]; D = [0 0 0 1];
x = getX(id, C, D);

model = getIV(id,na,nb,x);
compare(model,val)