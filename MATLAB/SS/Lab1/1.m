%% 1
x = -pi:0.02*pi:pi;
plot(x, max(sin(x), cos(x)), 'c', 'LineWidth', 5); hold on
plot(x, sin(x), '--b', x, cos(x), '-.r', 'LineWidth', 3); grid
axis([-pi, pi, -1.1, 1.1]), set(gca, 'FontSize', 12);shg

%% 2
a=1;b=.1;
t = 0:0.01:8*pi;
x = a*exp(b*t).*cos(t);
y = a*exp(b*t).*sin(t);
figure, plot(x,y, 'r', 'LineWidth', 2), box on
set(gca, 'FontSize', 16, 'FontWeight', 'Bold', 'XColor', [0 0 1], 'YColor', [0 0 1], 'XTick', [-5 0 5 10], 'YTick', [-10 -5 0 5])
title('\fontsize{20}\color{blue}(ae^{bt}cos(t) ae^{bt}sin(t))', 'BackgroundColor', [0.5 1 1], 'EdgeColor', 'b', 'LineWidth', 2);

%% 3
%step signal u(t) = (t>=0) ? 1 : 0;
t1 = -2; t2 = 6; tstep = 0.001;
t = t1:tstep:t2;
x = (t>=0);
plot(t,x)
xlabel('t');ylabel('u(t)'); title('Unit step signal');
axis([t1-tstep, t2+tstep, -0.1 1.1]);

x=@(t) (t>=0);
t1 = -2; t2 = 6;
t = [t1, t2];
fplot(x, t);
xlabel('t'); ylabel('u(t)');
axis([t -0.1 1.1])
title('Unit step signal');
%% 4
%pulse signal p(t) = ((t>=0) && (t<e)) ? 1/e : 0;
e = 1/100;
t1 = -1; t2 = 5; tstep = 0.005;
t = t1:tstep:t2;
x = (1/e)*((t>0)&(t<=e));
plot(t,x);
xlabel('t');ylabel('p_\epsilon(t)');
title('Pulse function \epsilon = 1/100')


e = 1/100;
x = @(t)(1/3)*((t>0)&(t<=e));
t1 = -1; t2 = 5;
t = [t1, t2];
fplot(x,t,5000);
set(gca, 'FontSize', 14);
xlabel('t'); ylabel('p_\epsilon(t)');
axis([t1 t2 -0.1 1.1/e])
title('Pulse function \epsilon = 1/100') 
shg

%% 5
%sine signal x(t) = Asin(2 pi t + phi);
A = 2; T = 1/10; phi = pi/3;
t1 = -0.1; tstep = 0.005; t2 = 0.2;
t = t1:tstep:t2;
xs = A*sin(2*pi/T*t + phi);
plot(t,xs, 'LineWidth', 2);grid;
xlabel('t');ylabel('x_s(t)');
title('x_s(t) = A sin((2 \pi /T) t + \phi)')
%% 6
A = 2; T = 1/10; phi = pi/3;
xs = @(t)(A*sin(2*pi/T*t + phi));
t1 = -0.1;t2=0.2;
t=[t1, t2];
fplot(xs, t);grid
xlabel('t');ylabel('x_s(t)');
title('x_s(t) = A sin((2 \pi /T) t + \phi)')

%% 7
%exponential signal
a = 0.2; b = -0.5;
t1 = 0; tstep = 0.5; t2 = 8;
t = t1:tstep:t2;
xe = a*exp(b*t);
plot(t, xe); grid
xlabel('t'); ylabel('x_e(t)');
title('x_e(t) = a e^{bt}')

%% 8
a = 0.2; b = -0.5;
xe = @(t)(a * exp(b*t));
t1 = 0; t2 = 8;
t = [t1, t2];
fplot(xe,t); grid
xlabel('t'); ylabel('x_e(t)');
title('x_e(t) = a e^{bt}')

%% 9 DISCRETE TIME
%unit step sequence u[n] = (n>=0) ? 1 : 0;
n1 = -5; n2 = 10;
n = n1:n2;
x = (n>=0);
stem(n,x);
xlabel('n'); ylabel('u[n]');
title('Unit step sequence')

%% b
n1 = -5; n2 = 10; n = n1:n2;
x = @(n) (n>=0);
stem(n, x(n));
xlabel('n'); ylabel('u[n]');

%% 10
%unit impulse sequence delta[n] = (n==0) ? 1:0;
n1 = -5; n2 = 10; n = n1:n2;
x = (n==0);
stem(n,x);
xlabel('n'); ylabel('\delta_n');
axis([n1 n2 -0.1 1.1]);

%% b 
n1 = -5; n2 = 10; n = n1:n2;
x = @(n)(n==0);
stem(n,x(n));
xlabel('n'); ylabel('\delta_n');

%% 11 DE FACUT DE LA DISCRETE
%sine sequence  si exponential sequence

%% bidimensional signals
t = 0:0.01*pi:2*pi;
x = cos(2*pi*t); y = sin(2*pi*t); z = t;
plot3(x,y,z, 'LineWidth', 2); grid; view(20,30)
xlabel('x'); ylabel('y'), zlabel('z')

%% 2
[t,p] = meshgrid(0:.02*pi:3*pi, 0:.02*pi:3*pi);
figure, surf(t, p, t/2.*sin(p)), xlabel('t'), ylabel('p'), title('t/2 sin(p)')
view(40,60)
%% 3
I = imread('peppers.png'); I = rgb2gray(I);
figure, imshow(I)
[x,y] = meshgrid(1:size(I,2), 1:size(I,1));
figure, surf(x,y,double(I)), shading flat, colormap gray