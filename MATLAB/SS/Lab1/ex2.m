t1=0;tstep=0.01;t2=2;
t=t1:tstep:t2;

n1=-5;n2=10;n=n1:n2;

xa=@(n)(4*cos(pi*n));
xb=@(n)(2*sin(3*n));
xc=@(n)((0.9).^n*cos(pi*n/10));
xd=@(t)(4*sin(5*pi*t-pi/4));
xe=@(t)(cos(4*t)+2*sin(8*t));
xf=@(t)(3*cos(4*t)+sin(pi*t));

%stem(n,xa(n));
%stem(n,xb(n));
%stem(n,xc(n));

plot(n,xd(n));shg
