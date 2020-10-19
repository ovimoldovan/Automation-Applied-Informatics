
M=128;
T=64;
w=2*pi/T;
t1=0;
t2=1000;
tstep=1;
t=t1:tstep:t2;
phi=0;
A=2;
N=1000;

x0=@(t)sin(w*t);


xk=@(k)(A*rand(1,k));
%k=length(t);
n=1:N-M;

x=@(t)(x0(t)+xk(length(t)));
phixx=@(n)(fn(n,M,x))/M;
plot(n,x0(n),'r'); hold on; grid;
plot(n,x(n),'g'); hold on;
plot(n,phixx(n),'b'); legend('sin','sin+noise','autocorrelate');