%% u(t)
u = @(t)(1.*(t>=0) + 0 .*(t<0));
fplot(u, [-10 10]);
%% u(t-t0)
t0 = 2;
u = @(t)(1.*((t-t0)>=0) + 0 .*((t-t0)<0));
fplot(u, [-10 10]);
%% symmetric function
A = 2;
T = 4;
u = @(t)(1.*(t>=0) + 0.*(t<0));
%i = @(t)(A * (u(t + T/2) - u(t - T/2)));
i = @(t)(A * u(t-T/2) - A * u(t + T/2));
fplot(i, [-10 10],3000);grid;shg
%%

%% vikk
T=4;
A=2;

u=@(t)(0.*(t<0) + 1.*(t>=0));
i=@(t)(A*(u(t+T/2)-u(t-T/2)));
fplot(i,[-10 10],3000);
grid;
%
%% triunghi
T = 4;
u=@(t)(0.*(t<0) + 1.*(t>=0));
v=@(t)((2/T * t + 1).*(u(t+T/2) - u(t)) + (-2*t/T + 1).* (u(t) - u(t - T/2)));
fplot(v, [-10, 10], 3000)
%% vikk
T=4;
A=2;

u=@(t)(0.*(t<0) + 1.*(t>=0));
v1=@(t)((2*t/T+1).*(u(t+T/2)-u(t)));
v2=@(t)((-2*t/T+1).*(u(t)-u(t-T/2)));
v=@(t)(v1(t)+v2(t));

fplot(v,[-5 5]);
grid;
%% ex 1 a

A = 2;

u = @(t)(1.*(t>0) + 0.*(t<0));
%i = @(t)(A * (u(t + T/2) - u(t - T/2)));
i = @(t)(-A * u(t));
fplot(i, [-10 10], 3000);grid;shg
% la a 4-a e u(-t)


%% ex 2
A=1;
T=0;
u=@(t)(0.*(t<T) + A.*(t>=T && t<=T+A) + 0.*(t>T+A));

fplot(u, [-1 2]);
grid;


