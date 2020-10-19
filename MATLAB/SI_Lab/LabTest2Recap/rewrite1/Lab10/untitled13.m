clear all; close all;
load('lab10_1.mat');
na = 3*n; nb = 3*n;

delta = 0.01;
Pinv0 = 1/delta * eye(na+nb);

theta0 = zeros(1, na+nb)';

theta = thetaFunc(id,na,nb,theta0, Pinv0);

A = [1 theta(1:na)];
B = [0 theta(na+1:na+nb)];
model = idpoly(A,B,[],[],[],0,id.Ts);

compare(model, id)