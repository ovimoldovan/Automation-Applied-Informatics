clear all;
load('lab2_order2_1.mat')

%plot(data)

u = data.u;
y = data.y;

uid = u(1:100);
yid = y(1:100);
tid = t(1:100);

plot(tid,yid,tid,uid)

uss = u(99);
yss = mean(yid(90:100))

k = yss/uss;

ymax = max(yid)
x = find(yid>=ymax);
t1 = tid(x)

ymin = min(yid(x:100))

x = find(yid<=ymin)

t2 = tid(x(length(x)))


ymax2 = max(yid(x(length(x)):100))

x = find(yid>=ymax2)
t3 = tid(x(length(x)))


M = (ymax - yss)/yss
zeta = log(1/M)/sqrt(pi^2 + (log(M))^2)
T0 = t3 - t1;
wn = (2*pi)/(T0 * sqrt(1-zeta^2))

H = tf([k*wn^2],[1, 2*zeta*wn, wn^2])

ysim1 = lsim(H,uid,tid)

%plot(tid,yid,tid,ysim1)

uval = u(201:500);
yval = y(201:500);
tval = t(201:500);

ysim2 = lsim(H,uval,tval)

plot(tval,yval,tval,ysim2)