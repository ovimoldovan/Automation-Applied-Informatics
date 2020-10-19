clear all
load('lab4_order2_1.mat')
figure(1)
plot(data)

figure(2)

u = data.u;
y = data.y;

uid = u(30:130);
yid = y(30:130);
tid = t(30:130);

%plot(tid,yid)

uss = mean(uid(91:100)); 
yss = mean(yid(91:100));

t1 = 1.85;
t3 = 3.55;
T0 = t3 - t1

k = yss/uss;

t00 = 1.5;
t00i = 2;
t01 = 2.4;
t01i = 20;
t02 = 3.2;
t02i = 36;

Ap = sum(yid(t00i:t01i) - yss);
Am = sum(yss-yid(t01i:t02i));

M = Am/Ap; %overshoot
tita = (log(1/M))/sqrt(pi^2+(log(M))^2); %damping factor
%T0 = 2*(t2-t1); %oscillation period
wn = 2*pi / (T0 * sqrt(1-tita^2)); %natural freq
H = tf(k*wn^2,[1 2*tita*wn wn^2]);


  %nush dc nu mere

%T = k/ymax

%H = tf(k*wn^2, [1 2*zeta*wn wn^2])

x0 = yss;

Hss = ss(H)

ysim1 = lsim(Hss,uid,tid,[yss, 0]);

plot(tid,yid,tid,ysim1)
%%
uval = u(130:330);
tval = t(130:330);
yval = y(130:330);

ysim2 = lsim(Hss,uval,tval,[y(1), 0])

figure(3)
plot(tval,yval,tval,ysim2)