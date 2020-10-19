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