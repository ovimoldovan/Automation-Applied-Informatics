load('lab4_order1_2.mat');
plot(data)
figure()
hold off;
y = data.y;
u = data.u;
yid = y(31:130);
uid = u(31:130);
tid = t(31:130);
plot(tid,yid);
%hold on; plot(tid,uid);shg
yss_v=y(91:100);
yss=mean(yss_v);
uss_v=u(91:100);
uss = mean(uss_v);

k = yss/uss

ymax = max(yid)

%t1 = find(yid==ymax)
y2 = yss + 0.368*(ymax-yss);
%t2_v = find(yid>=y2);
%t2 = t2_v(length(t2_v))

t1 = 3.72;
t2 = 5.24;


T = t2-t1
%T0 = 2*(t2-t1);
H = tf(k, [T 1])

x0 = yss %x0=y0

%lsim(H,u,t,x0);shg

A = -1/T; B = k/T; C = 1; D = 0;
Hss = ss(A,B,C,D);

ysimid = lsim(Hss,uid,tid);shg

tval = t(131:length(t));
uval = u(131:length(u));
yval = y(131:length(y));

ysim = lsim(Hss,uval,tval,yss);

plot(tval,yval,tval,ysim);shg
