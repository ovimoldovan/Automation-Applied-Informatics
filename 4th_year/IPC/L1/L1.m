%% Ex1
%approximations from the scope in simulink
ymax = 1.2;
yss= 0.65;
overshoot = (ymax-yss)/yss*100;
riseTime=1.5;
peakTime=2;
settlingTime=21;
ssError=1-yss;
Hs = tf([8],[1 0.4 12]);
step(Hs)
%% Ex 2
clc;clear all;
ymax = 1.18;
yss = 1;
overshoot = (ymax-yss)/yss*100;
riseTime = 2.2;
peakTime = 2.5;
settlingTime = 7.5;
ssError = 0;
HsPI = tf([1.2 2], [0.6 0])
HsTP = tf([2], [1 2 4])
Hol = series(HsPI, HsTP)
Hcl = feedback(Hol, 1);
step(Hcl)