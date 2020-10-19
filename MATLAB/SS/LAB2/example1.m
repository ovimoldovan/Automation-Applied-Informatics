%% 1 
x = @(t)(4*cos(pi*t-2*pi/5));
fplot(x, [-2, 3]);grid;xlabel('Time(sec)'); ylabel('x(t)')
%% 2
x = @(t)(3*cos(2*pi/3*t - 1.91));
fplot(x, [-5, 5]);grid

%% 3
a = @(t)(-sin(pi*t - acos(0)).*(t<=0) + (-sin(pi*t - acos(0)) + 2).*(t>0))
fplot(a, [-4, 4]);grid
%% 4
c = @(n)(cos(pi*n));
n = -5:5;
stem(n,c(n));
%% 5 
d = @(t)(mod(-t, 10) - 5);
fplot(d, [5, 35]);grid

%% ex 2
%% 1
u = @(t)(1 .*(t>0) + 0 .* (t<=0));
x = @(t)(4*u(t) + 2*sin(3*t));
fplot(x, [-10, 10]); grid
%% u(t)
u = @(t)(1 .*(t>0) + 0 .* (t<=0));
fplot(u, [-10, 10]);grid;shg