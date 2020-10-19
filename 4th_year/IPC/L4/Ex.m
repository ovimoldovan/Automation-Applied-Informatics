% zoh nu e absolut necesar in simulink
% 4.10 introducem functiile de transfer sub forma a 2 functii diferite
clear all;clc;
Hs = tf(4.3, conv([5,1],[23,1]), 'InputDelay',2.5);
samplingTime=0.5;
Hz = minreal(c2d(Hs, samplingTime, 'zoh'));
[n,d] = tfdata(Hz, 'v');
d=[d 0 0 0 0 0];
%Hzz=tf(n,d,samplingTime,'Variable', 'z^-1', 'IoDelay', 2)
Hzz = filt(n,d,samplingTime)
step(Hz)
T0 = (23 + 5)/2
Ho1 = tf([1], [T0, 1], 'IoDelay', 2.5)
Ho1z = c2d(Ho1, samplingTime, 'zoh')
[n2,d2] = tfdata(Ho1z, 'v')
d2 = [d2 0 0 0 0 0];
Ho1zz = filt(n2,d2,samplingTime);
Hdc = minreal(Ho1zz/(1-Ho1zz)*(1/Hzz))
[n3,d3] = tfdata(Hdc, 'v')

zpk(Hdc)
