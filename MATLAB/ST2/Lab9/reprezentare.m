function []=reprezentare(Hd)
x=0:0.01:2*pi;
plot(sin(x),cos(x),'r');% cercul de raza unitate 
[num,den]=tfdata(Hd,'v');
poli=roots(den);
zerouri=roots(num);
hold;
plot([0 0],[-1.2 1.2],'--k',[-1.2 1.2],[0 0],'--k') 
plot(real(poli),imag(poli),'x','MarkerSize',6); 
plot(real(zerouri),imag(zerouri),'o','MarkerSize',6); 
title('Planul z')
axis([-1.2 1.2 -1.2 1.2])
hold;shg