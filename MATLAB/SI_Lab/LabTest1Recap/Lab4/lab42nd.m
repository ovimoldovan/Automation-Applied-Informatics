%% data
load('lab4_order2_1.mat');
plot(data); hold

%% identification 
u=data.U;
y=data.Y;

yid = y(1:130);
uid = u(1:130);
tid = t(1:130);
yss = 0.496;
uss = 1;
k = yss/uss; %the gain
t00=1.56;
t01=2.43;
t02=3.32;
t1=1.9;
t2=2.7;
t3=3.5;
k00=32; %from the table t
k01=50;
k02=67;
Ts = 0.05;

k1=k00:k01;
k2=k01:k02;
Ap = sum(y(k1)-yss)*Ts; %the surfaces
Am = sum(yss-y(k2))*Ts;

M = Am/Ap; %overshoot
tita = (log(1/M))/sqrt(pi^2+(log(M))^2); %damping factor
T0 = 2*(t2-t1); %oscillation period
wn = 2*pi / (T0 * sqrt(1-tita^2)); %natural freq
Hf = tf(k*wn^2,[1 2*tita*wn wn^2]);

plot(tid,yid);hold
lsim(Hf,uid,tid,yss,'r');

title('identification');

%% general state space model identification
A = [0 1; -wn^2 -2*tita*wn];
B = [0; k*wn^2];
C = [1 0];
D = 0;
sys = ss(A,B,C,D);
plot(tid,yid); hold

lsim(sys,uid,tid,[yss,0],'r');


title('GSSM');

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

%% GSM validation
A = [0 1; -wn^2 -2*tita*wn];
B = [0; k*wn^2];
C = [1 0];
D = 0;

sys = ss(A,B,C,D);
plot(tval,yval); hold
lsim(sys,uval,tval,[yss,0],'r');
title('GSSM for validation');