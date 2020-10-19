clear all;
load('lab9_4.mat');
U=id.u;
Y=id.y;
C=[1 1];
D=[0 0 0 1];
N=length(U);
nc=length(C)-1;
nd=length(D)-1;
theta=[C(2:end) D(2:end)]';
X=X_computation(N,U,nc,nd,theta);
na=3; nb=3;
model=iv_computation(id,na,nb,X);

model2=arx(id,[na,nb,1]);
C1=model2.A;
D2=model2.B;
nc=length(C1)-1;
nd=length(D2)-1;
theta=[C1(2:end) D2(2:end)]';
X=X_computation(N,U,nc,nd,theta);
model12=iv_computation(id,na,nb,X);
figure(1)
compare(model12,val,model2);

modeliv = iv(id, [na, nb, 1], C, D);
modeliv2=iv(id, [na, nb, 1], C1, D2);
figure(2)
compare(modeliv2,val,model2);
