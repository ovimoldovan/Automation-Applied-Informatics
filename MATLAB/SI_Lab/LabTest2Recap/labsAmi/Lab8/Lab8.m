clear all;
load('lab8_4.mat');
Y=id.y;
U=id.u;
i=1;
f=1;
b=1;
thetav=[f;b];
thetan=[1.1;1.1];
i=i+1;
while i<500 && (norm(thetan-thetav))>0.0001
thetav=thetan;
N=150;
E(1)=Y(1);
dv=0;
H=0;
for k=2:N
  E(k)=-f*E(k-1)+Y(k)-b*U(k-1)+f*Y(k-1);
  dEf(k)=-E(k-1)+Y(k-1);
  dEb(k)=-U(k-1);
  dE=[dEf(k);dEb(k)];
  dv=dv+(2/N)*E(k)*dE;
  H=H+(2/N)*dE*dE';
end
m=0.01*inv(H)*dv;
thetan=thetav-m;
f=thetan(1,1);
b=thetan(2,1);
i=i+1;
end
A=1;
B=[0,thetan(2,1)];
C=1;
D=1;
F=[1,thetan(1,1)];
model=idpoly(A,B,C,D,F,0,id.Ts);
compare(model,val);