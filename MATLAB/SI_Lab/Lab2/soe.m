clear all;
load('lab2_order2_2.mat');
plot(data);
y = data.y;
u = data.u;
yid = y(1:100);
uid = u(1:100);
tid = t(1:100);
plot(tid, yid);
yss_v=y(91:100);
yss=mean(yss_v);
uss = uid(99); 
%=> k
k = yss/uss;

ymax=max(yid);
t1_index = find(yid==ymax);
t1 = tid(t1_index);
M = (y(t1_index)-yss)/yss;
zeta = log(1/M)/sqrt(pi^2+log(M)^2);

%[peaks, x1] = findpeaks(yid);
%t0 = tid(x1(2)) - tid(x1(1))

t3 = 9.33;
t0 = t3 - t1; %2(t2-t1)=t0
wn = 2*pi/t0/sqrt(1-zeta^2);

H = tf(k*(wn^2), [1, 2*zeta*wn, wn^2]);

%validation
uval=u(201:500);
tval=t(201:500);
ysim=lsim(H,uval,tval);
yval = y(201:500);
plot(tval,yval,tval,ysim)

%mean square error
sum = 0;
for i=1:300
    sum = sum + (ysim(i)-yval(i))^2;
end
mse = sum/300