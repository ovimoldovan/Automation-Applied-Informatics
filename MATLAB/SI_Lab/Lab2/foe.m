load('lab2_order1_2.mat');
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
%T %find
T_v = find(yid>=0.632*yss);
T = tid(T_v(1));
H = tf(k, [T 1]);
% validation
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