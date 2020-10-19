%% performance highlighting
close all %closing current windows
h = tf(7, [3 1 10]); %declaring a second order element
k = 7/10; %factor de proportionalitate / GAIN FACTOR
wn = sqrt(10/3); %natural frequency
df = 1/3/2/wn; %damping factor
step(h); %step response graph
hold; % holding the current state

%overshoot
sigma = k*exp(-pi*df/sqrt(1-df^2));
% first maximum value
ymax = k*(1+exp(-pi*df/sqrt(1-df^2)));
%the time it takes to reach the first maximum value
tmax = pi/wn/sqrt(1-df^2);
% placing the maximum point
plot(tmax,ymax,'.b', 'MarkerSize', 20);
%placing a vertical line through maximum point
plot([tmax tmax], [0 ymax], '--')
%highlighting the line limit of steady state value
plot([0 tmax], [0 ymax], '--')
%text formula for maximum
s = '$y_{max} = k(1+e^\frac{-\pi\xi}{\sqrt{1-\xi^2}})$' ;
text(tmax + 0.5, ymax, s, 'Interpreter', 'Late', 'FontSize', 40);
%text formula for the time to reach the maximum value
s = '$t_{max}=\frac{\pi}{\omega_n\sqrt{1-\xi^2}} $' ;
text(tmax, 0.1, s, 'Interpreter', 'Latex', 'FontSize', 40);
%response time
ts = 4/df/wn;
%text formula for time response
s = '$t_s=\frac{4}{\xi\omega_n}$';
text(4/df/wn, k+0.1, s, 'Interpreter', 'Latex', 'FontSize', 40, 'FontWeight', 'bold')
plot(4/df/wn, k, '.b', 'MarkerSize', 20);
plot([4/df/wn 4/df/wn], [0 k], '--');shg
%% 3d
%mesh(tm, ym)
%% a
k = 3;
wn = 4;
xi = [0, 0.06, 0.1:0.1:1];
%timpul de simulare
tfin = 5/wn/xi(2);
t = 0:tfin/100:tfin; %101 valori
l = length(t);
lxi = length(xi); ym = zeros(l,lxi);
for i=1:length(xi)
    y = step(k*wn^2, [1, 2*xi(i)*wn, wn], t); %vector coloana de lungimea vectorului timp
    ym(:,i) = y;
    tm(:,i) = t'; %pentru mesh 3d
end
plot(ym);legend(num2str(xi'));shg
%mesh(tm, ym)
mesh(ym, tm); shg

%% b
k = 3;
wn = 10:10:100;
xi = 0.3;
%timpul de simulare
tfin = 5/max(wn)/xi;
t = 0:tfin/100:tfin; %101 valori
l = length(t);
lwn = length(wn); ym = zeros(l,lxi);
for i=1:lwn
    y = step(k*wn(i).^2, [1, 2*xi.*wn(i), wn(i).^2], t); %vector coloana de lungimea vectorului timp
    ym(:,i) = y;
    tm(:,i) = t'; %pentru mesh 3d
end
plot(ym);legend(num2str(xi'));shg
%mesh(tm, ym)
mesh(ym'); shg
%% figure 3.1
tmax = 0.32;
ymax = 4.5;
yss = 3;
ts = 1.8;
k = yss;
sigma = ymax/k-1;
s = log(sigma)^2;
ti = sqrt(s/(s+pi^2));
wn=4/ti/ts;
H = tf(k*wn^2,[1, 2*wn*ti, wn^2]);shg
step(H);
%% figure 3.2
k = 3;
wn = 4;
xi = [0.01, 0.06, 0.1:0.1:1];
%timpul de simulare
tfin = 0.5/wn/xi(1);
t = 0:tfin/100:tfin; %101 valori
l = length(t);
lxi = length(xi); ym = zeros(l,lxi);
for i=1:length(xi)
    y = step(k*wn^2, [1, 2*xi(i)*wn, wn], t); %vector coloana de lungimea vectorului timp
    ym(:,i) = y;
    tm(:,i) = t'; %pentru mesh 3d
end
plot(ym);legend(num2str(xi'));shg
%mesh(tm, ym)
%mesh(ym, tm); shg



