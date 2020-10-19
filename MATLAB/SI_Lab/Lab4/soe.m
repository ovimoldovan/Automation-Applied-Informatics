clc;clear all;
load('lab4_order2_2.mat');
plot(data);shg
y = data.y;
u = data.u;
yid = y(31:130);
uid = u(31:130);
tid = t(31:130);
figure(2)
plot(tid,yid);
figure(3)
yss_v=y(1:30);
yss=mean(yss_v);
uss_v=u(1:30);
uss = mean(uss_v);

ymax = max(yid)


t1 = 3.11;
t2 = 4.2;
t3 = 5.33;
%T0 = 2 * (t2-t1) %!MISTAKE - I WAS MISTAKING t2 for t3
T0 = t3 - t1

k = yss/uss
%k=1;

t00 = 2.66;
t00_index = 31;
t01 = 3.82;
t01_index = 44;
t02 = 4.88;
t02_index = 56;

Ap = sum(yid(t00_index:t01_index)-yss)
Am = sum(yss - yid(t01_index:t02_index))

M = Am/Ap

zeta = log(1/M)/sqrt(pi^2+(log(1/M))^2)


wn = 2*pi/T0/sqrt(1-zeta^2);

H = tf(k*wn^2, [1 2*zeta*wn wn^2])

A = [0,1;-wn^2, -2*zeta*wn];B=[0;k*wn^2];C = [1,0];D = 0; %Another mistake I had: B was [0;k*wn]
Hss = ss(A,B,C,D)
%Hss = ss(H)

tval = t(131:length(t));
uval = u(131:length(u));
yval = y(131:length(y));



ysim = lsim(Hss,uval,tval,[yss, 0]);

plot(tval,yval,tval,ysim);shg