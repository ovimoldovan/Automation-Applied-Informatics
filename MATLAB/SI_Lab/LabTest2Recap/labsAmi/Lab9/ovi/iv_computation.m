function [ model] =iv_computation(id,na,nb,X)
N=length(id.u);
y=[zeros(1,na) id.y'];
u=[zeros(1,nb) id.u'];
x=[zeros(1,na) X];
phit=zeros(na+nb);
yt=zeros(na+nb,1);
for k=1:N
     Z=[-x((k+na-1):-1:k) u((k+nb-1):-1:k)]';
     phi=[-y((k+na-1):-1:k) u((k+nb-1):-1:k)]';
     phit=phit+1/N*(Z*phi');
     yt=yt+1/N*(Z*id.y(k));
end
theta=phit\yt;
A=[1 theta(1:na)'];
B=[0 theta(na+1:na+nb)'];
model=idpoly(A,B,1,1,1,0,id.Ts);
end

