%% data
load('lab4_order1_1.mat');
plot(data); hold

%% identification
u=data.U;
y=data.Y;
ymax = 2.24; % the maximum output value
yss = 1.47; % steady state output value
uss = 0.5; %steady state input value
y2 = yss+(ymax-yss)*0.368;
yid = y(1:130);
uid = u(1:130);
tid = t(1:130);
k = yss/uss; %the gain
t1 = 9.92;
t2 = 14.7;
T=t2-t1; 
Hf = tf(k,[T 1]); %transfer function
plot(tid,yid);hold
lsim(Hf,uid,tid,yss,'r');
title('identification');

%% state space model method
A = -1/T;
B = k/T;
C = 1;
D = 0;
sys = ss(A,B,C,D);
plot(tid,yid); hold
lsim(sys,uid,tid,yss,'r');
title('SSM method identif');

%% validation
yval = y(131:end);
uval = u(131:end);
tval = t(131:end);
plot(tval,yval); hold
ysim=lsim(Hf,uval,tval,yss,'r');
lsim(Hf,uval,tval,yss,'r');
title('validation');
N=330-130;
MSE = (sum((ysim-yval).^2))/N; %Mean Square error for the validation

%% state space model method for validation
plot(tval,yval);hold
lsim(sys,uval,tval,yss,'r');
title('SSM method val');

