%% first order element - 
%the circuit parameters
R1 = 1e3; R2 = 1e3; C1 = 1e-6;
%the transfer function parameters
k = R1/R2; %gain factor
T = R2 * C1; %time constant
%declare the transfer function
H = tf(k, [T,1]);
step(H);

%% the time specifications
close all
%Rise time
tr = 2.5 * T;
ts = 4 * T; %settling time
%tp = simulation time
%steady state value
tss = 9*T;
yss = k;
%simulation time
tss = 9*T;t=0:tss/100:tss;
y = step(H,t)
%plot(t,y);
plot(t,y,'k',tr,0.9*k,'or')
text(tr*1.1,k*0.9,'Rise time')
hold
plot(ts, 0.98 * k, 'ob')
text(ts * 1.1, 0.98*k, 'Settling time')
plot(tss, k, 'om')
hold
text(tss, 0.9 * k, 'Steady state Value')
%step(H)
%hold
%% varying the gain factor
clear all
R1 = [1e3, 2.2e3, 4.7e3, 1e4]; R2 = 1e3; C1 = 1e-6;
T = R2 * C1;
for i=1:length(R1)
    H{i} = tf(R1(i)/R2, [T,1]);
end 
step(H{1:4});
legend('R1 = 1k/Omega', 'R1 = 2.2k/Omega', 'R1 = 4.7k/Omega', 'R1 = 10k/Omega');shg;grid

%% Time constant variation
C1 = [0.01, 0.1, 1] * 1e-6;
R1 = 1e3; R2 = 1e3;
T = R2 .* C1;
for i=1:length(C1)
    H{i} = tf(R1/R2, [T(i),1]);
end 
step(H{1:3})
legend('C1 = 0.01\muF', 'C1 = 0.1\muF', 'C1 = 1\muF' );shg;grid

%% Square wave response
R1 = 1e3; R2 = R1; C1 = 1e-6;
T = R2 * C1; k = R1/R2;
Tu = 16*T; wu = 2*pi/Tu;
t = 0:Tu/50:2*Tu;
H = tf(k, [T,1]);
lsim(H, square(wu*t), t)
grid;shg;
title('Squarewave response of the FOE')