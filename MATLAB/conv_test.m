t=0:0.1:10;
u=sin(t);
h = dirac(2);
plot(t,u);hold on;

stem(h)

c = conv(u,h);
figure(2)
plot(t,c);