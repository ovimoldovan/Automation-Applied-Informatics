%ex2

u=@(t)(1.*(t>=0)+0.*(t<0));

%a
xa=@(t)(4*cos(5*pi*t)-pi/4);
%fplot(xa,[-5,5]); grid;xlabel('Time(sec)');ylabel('xa(t)');
phi_a=0;
wa=5*pi;
Ta=2*pi/wa;
%period is Ta=0.4sec

%b
xb=@(t)(4*u(t)+2*sin(3*t));
%fplot(xb,[-50,50]); grid;xlabel('Time(sec)');ylabel('xb(t)');
%not periodic

%c
xc=@(t)(u(t)-1/2);
%fplot(xc,[-5,5]); grid;xlabel('Time(sec)');ylabel('xc(t)');
%nnot periodic

%d
xd=@(t)(3*cos(4*t)+sin(pi*t));
%fplot(xd,[-5,5]); grid;xlabel('Time(sec)');ylabel('xd(t)');
%T1=2*pi/4=pi/2;T2=2*pi/pi=2; T=2*pi;

%e
xe=@(t)(cos(3*pi*t)+2*cos(4*pi*t));
%fplot(xe,[-5,5]); grid;xlabel('Time(sec)');ylabel('x(t)');
%T1=2*pi/(3*pi)=2/3;T2=2*pi/(4pi)=1/2;T=2;

%f
xf=@(t)(4*cos(3*pi*t+pi/4)+u(t));
%fplot(xf,[-5,5]); grid;xlabel('Time(sec)');ylabel('x(t)');
%not periodic

%g
w1=pi;
xg=@(t)(cos(2*w1*t)+cos(3*w1*t));
%fplot(xg,[-5,5]); grid;xlabel('Time(sec)');ylabel('x(t)');
%T1=2w,T2=3w,T=6w1

%h
xh=@(t)(4*cos(3*pi*t+pi/2)+2*cos(8*pi*t+pi/2));
%fplot(xh,[-5,5]); grid;xlabel('Time(sec)');ylabel('x(t)');
%t1=2/3, t2=1/4,t=2

%i
xi=@(t)(4*cos(3*pi*t+pi/2)+4*cos(10*pi*t-pi/2));
%fplot(xi,[-5,5]); grid;xlabel('Time(sec)');ylabel('x(t)');
%t1=2/3,t2=1/5;t=2;

%j
n=-5:5;
xj=@(n)(4*cos(pi*n-2));
%stem(n,xj(n)); grid;xlabel('n');ylabel('x(n)');
%t=2

%k
xk=@(n)(2*sin(3*n));
%stem(n,xk(n)); grid;xlabel('n');ylabel('x(n)');
%t=2/3

%l
xl=@(n)(4*cos(0.5*pi*n+pi/4));
%stem(n,xl(n)); grid;xlabel('n');ylabel('x(n)');
%t1=4

%m
xm=@(t)(4*cos(3*pi*t+pi/4)+2*cos(4*pi*t));
%fplot(xm,[-5,5]); grid;xlabel('Time(sec)');ylabel('x(t)');
%t1=2/3,t2=1/2, t=2

%n
xn=@(n)(12*cos(20*n));
%stem(n,xn(n)); grid;xlabel('n');ylabel('x(n)');
%t=pi/10

%o
xo=@(n)(10*cos(20*pi*8*n));
%stem(n,xo(n)); grid;xlabel('n');ylabel('x(n)');
%t=pi/80

%p
xp=@(n)(10*cos(8*n));
stem(n,xp(n)); grid;xlabel('n');ylabel('x(n)');
%t=pi/4