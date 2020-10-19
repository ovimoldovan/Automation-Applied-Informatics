clear all
load('lab4_order1_1.mat')
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

ymax=max(yid)
k = yss/uss;
y2 = yss+ 0.368* (ymax-yss)
x = find(yid>=y2)
t2 = tid(x(length(x)))


x = find(yid>=ymax)
t1 = tid(x(1))


T = t2 - t1  %nush dc nu mere

%T = k/ymax

H = tf(k, [T 1])

x0 = yss;

Hss = ss(H)

ysim1 = lsim(Hss,uid,tid,x0);

plot(tid,yid,tid,ysim1)

uval = u(130:330);
tval = t(130:330);
yval = y(130:330);

ysim2 = lsim(Hss,uval,tval,yss)

figure(3)
plot(tval,yval,tval,ysim2)