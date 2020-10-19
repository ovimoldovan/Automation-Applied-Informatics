clear;
load('lab10_5.mat');
% delta 0.01 100%
delta=1e-3;
na=3*n;
nb=3*n;
theta0=zeros(na+nb,1);
Pinv0=(1/delta)*eye(na+nb);
procent=100;
theta=theta_computation(id,na,nb,theta0,Pinv0,procent);

A=[1 theta(1:na)];
B=[0 theta(na+1:na+nb)];
model1=idpoly(A,B,[],[],[],0,id.Ts);
compare(model1,val);

% delta 0.01 10% 
delta=1e-3;
na=3*n;
nb=3*n;
theta0=zeros(na+nb,1);
Pinv0=(1/delta)*eye(na+nb);
procent=10;
theta=theta_computation(id,na,nb,theta0,Pinv0,procent);

A=[1 theta(1:na)];
B=[0 theta(na+1:na+nb)];
model12=idpoly(A,B,[],[],[],0,id.Ts);
figure()
compare(model12,val);

% delta 100 100% converges rapidly  when the delta is higher so the model
% is poorer

delta=1e3;
na=3*n;
nb=3*n;
theta0=zeros(na+nb,1);
Pinv0=(1/delta)*eye(na+nb);
procent=100;
theta=theta_computation(id,na,nb,theta0,Pinv0,procent);

A=[1 theta(1:na)];
B=[0 theta(na+1:na+nb)];
model2=idpoly(A,B,[],[],[],0,id.Ts);
figure()
compare(model2,val);

% delta 100 10%

delta=1e3;
na=3*n;
nb=3*n;
theta0=zeros(na+nb,1);
Pinv0=(1/delta)*eye(na+nb);
procent=10;
theta=theta_computation(id,na,nb,theta0,Pinv0,procent);

A=[1 theta(1:na)];
B=[0 theta(na+1:na+nb)];
model2=idpoly(A,B,[],[],[],0,id.Ts);
figure()
compare(model2,val);

% rarx function 100%
N=length(id.u);
theta0=zeros(na+nb,1);
Pinv0=(1/delta)*eye(na+nb);
thetaRarx=rarx(id,[na,nb,1],'ff',1,theta0,Pinv0);
thetaRarx=thetaRarx(N,:);
A=[1 thetaRarx(1:na)];
B=[0 thetaRarx(na+1:na+nb)];
modelrecurs1=idpoly(A,B,[],[],[],0,id.Ts);
figure()
compare(modelrecurs1,val);

% rarx function 10%
N=length(id.u);
theta0=zeros(na+nb,1);
Pinv0=(1/delta)*eye(na+nb);
thetaRarx=rarx(id,[na,nb,1],'ff',1,theta0,Pinv0);
n=round(N/10);
thetaRarx=thetaRarx(n,:);
A=[1 thetaRarx(1:na)];
B=[0 thetaRarx(na+1:na+nb)];
modelrecurs1=idpoly(A,B,[],[],[],0,id.Ts);
figure()
compare(modelrecurs1,val);
