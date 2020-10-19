clear all;

load('lab10_4.mat')
na = 3*n; nb = 3*n;

delta = 1e-3;

theta0 = zeros(na + nb, 1);
Pinv0 = 1/delta * eye(na+nb);

theta = thetaFunc(id,na,nb,theta0,Pinv0);

A = [1 theta(1:na)];
B = [0 theta(na+1:na+nb)];


model1 = idpoly(A, B, [], [], [], 0, id.Ts);

compare(val,model1)
%%
figure(2)

delta = 100;

theta0 = zeros(na + nb, 1);
Pinv0 = 1/delta * eye(na+nb);

theta = thetaFunc(id,na,nb,theta0,Pinv0);

A = [1 theta(1:na)];
B = [0 theta(na+1:na+nb)];


model2 = idpoly(A,B,[], [], [], 0, id.Ts);

compare(val,model2)

%% rarx
figure(3)


delta = 0.01;

theta0 = zeros(na + nb, 1);
Pinv0 = 1/delta * eye(na+nb);

N = length(id.u)

theta2 = rarx(id,[na,nb,1],'ff', 1 ,theta0, Pinv0);
theta2 = theta2(N,:)
A = [1 theta2(1:na)];
B = [0 theta2(na+1:na+nb)];
model3 = idpoly(A,B,[],[],[],0,id.Ts);

compare(val,model3);
%% 
figure(4)
N = length(id.u)
n = round(N/10);


theta2 = rarx(id,[na,nb,1],'ff', 1 ,theta0, Pinv0);
theta2 = theta2(n,:);


A2 = [1 theta2(1:na)];
B2 = [0 theta2(na+1:na+nb)];
model4 = idpoly(A2,B2,[],[],[],0,id.Ts);




compare(val,model4)

