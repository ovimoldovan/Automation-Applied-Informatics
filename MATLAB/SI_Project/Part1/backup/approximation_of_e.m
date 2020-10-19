v=0:0.01:2;
e=exp(v);
Y=e';
N=size(v);
phi=ones(N(2),3); %3 din cauza ca este functia de ondinul 2, la proiect trebuie sa reglam onrdinul intre 2-3 (cred)
for i=1:N(2)
  phi(i,:)=[v(i)^2 v(i) 1];
end

size(phi)
size(Y)
theta=phi\Y  %nu puem sa folosim \

f=[theta(1) theta(2) theta(3)];
a=polyval(f,v);
plot(v,e,'r',v,a);
