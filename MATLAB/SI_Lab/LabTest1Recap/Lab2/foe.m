load('lab2_order1_1.mat')
y = data.y;
u = data.u;
%plot(data)

uid = u(1:100);
yid = y(1:100);
tid = t(1:100);

%plot(tid,yid)

yss = mean(yid(90:100));
uss = mean(uid(90:100));
k = yss/uss;

x = find(yid>=0.63*yss);
t2 = tid(x(1));
t1 = 0;

T = t2 - t1;

H = tf(k,[T 1])

%identification

ysim = lsim(H,uid,tid);

plot(tid, yid, tid, ysim)

figure(2)

% validation

uval = u(201:500);
yval = y(201:500);
tval = t(201:500);

yvalsim = lsim(H,uval, tval);

plot(tval, yval, tval, yvalsim)