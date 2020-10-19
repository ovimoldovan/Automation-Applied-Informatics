clear all; close all;
load('lab9_1.mat');
u = id.u;
y = id.y;
N = length(u);

C = [1 1];
D = [0 0 0 1];
nc = length(C) - 1;
nd = length(D) - 1;

theta = [C(2:end) D(2:end)]';

x = getX(u,C,D);

na = 2;
nb = 2;

x = [zeros(1,na) x];

model = getIV(id,na,nb,x);



model2 = arx(id, [na, nb, 1]);

C = model2.A;
D = model2.B;

model_iv2 = iv(id, [na,nb,1], C, D);
compare(val, model_iv2);