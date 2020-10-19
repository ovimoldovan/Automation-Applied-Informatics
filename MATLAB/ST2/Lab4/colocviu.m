clear;clc
% approximations for magnitude
%wma=[1 10 20 70 100 1e3];ma=[-5 -5 -5 6 6 6];
% approximations for phase
%wfa=[1 2 7 20 70 200 700 1e3];fa=[0 5 15 30 25 15 5 0];
% plotting the approximations

% punctele aproximate pentru modul
%wma=[10e-1 20 35 70 1e3];ma=[5 5 0 -6 -6];
%wma = [0.1, 1, 7, 10, 70 100];ma = [17 17 0 -3 -37 -43]
%wma = [0.01, 0.1, 1/3, 1/2, 3, 10]; ma = [6 6 16 16 0 -10]
%wma = [1,20,70,100,1000];ma = [-3 -3 -14 -14 -14];
% punctele aproximate pentru faza
%wfa=[1 2 7 20 35 70 200 700 1e3];fa=[0 -5 -15 -30 -35 -30 -15 -5 0];
% reprezentarea diagramei prin puncte aproximate
%wfa = [0.1, 0.7 1 10 70 100];fa = [-5, -25, -50, -140, -175, -180]
%wfa = [0.01, 0.1, 1/3, 1, 10]; fa = [5, 15, -5, -75, -90]
%wfa = [1 2 7 20 70 200 700 1000];fa = [0 -5 -15 -27 -30 -15 -5 0]

%wma = [0.1 2 5 10 20 100]; ma = [-2 -2 6 6 0 -14];
wfa = [0.2 0.5 1 2 5 10 20 100]; fa = [5 7 10 7 0 -30 -71 -85]

wma = [0.01, 1/3, 1/2, 0.7 2 10 100] ;ma = [10 10 6 0 -18 -32 -52]


subplot(211);semilogx(wma,ma,'ro-');grid
title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB');
subplot(212);semilogx(wfa,fa,'ro-');grid;shg;
title('Phase characteristics');ylabel('\angleH(j\omega) (degres)');
%%
% comparison with Bode in Matlab
h=tf([100, 0], [ 10 2500]);w=logspace(1e-2,3,1e2);
[m,f]=bode(h,w);
mv(1:1e2,1)=m(:,:,:);fv(1:1e2,1)=f(:,:,:);
subplot(211);semilogx(w,20*log10(mv),'b',wma,ma,'ro-');grid
title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB');
subplot(212);semilogx(w,fv,'b',wfa,fa,'ro-');grid;shg;
title('Phase characteristics');
xlabel('\omega (rad/sec)'); ylabel('\angleH(j\omega) (degres)');

figure(2);bode(h)
