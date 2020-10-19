clear all;close all;
load('lab9_3.mat');
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
 na = 2;
 nb = 2;
 %model = getiv(id,nc,nd,C,D);
 
 y = [zeros(1,na) id.y'];
 u = [zeros(1,nb) id.u'];
 
 x = [zeros(1,na) x];
 %% 
 phi_t = zeros(na+nb);
 y_t = zeros(na+nb,1);
 for k=1:N
     phi = [-y(k+na-1:-1:k) u(k+nb-1:-1:k)]'; %until k+na-na
     z = [-x(k+na-1:-1:k) u(k+nb-1:-1:k)]';
     phi_t = phi_t + 1/N*z*phi';
     y_t = y_t + 1/N*z*y(k+na);
 end
 
 theta = phi_t \ y_t;
 
 A = [1 theta(1:na)'];
 B = [0 theta(na+1:na+nb)'];
 
 model = idpoly(A,B,1,1,1,0,id.Ts);
 
 
 
 %% 
 ARX=arx(id,[na,nb,1]);
 C = ARX.A;
 D = ARX.B;
 
 %model2 = idpoly(C,D,1,1,1,0,id.Ts);
 model_iv = getIV(id,na,nb,x);
 

 model_iv2 = iv(id,[na,nb,1],C,D);
 
 compare(val,model_iv2);
 
 
 %compare(val,model2)
 
 
 
 