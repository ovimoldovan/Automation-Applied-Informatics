clear;clc
% punctele aproximate pentru modul
wma=[0.01 0.1 0.5 1 2 5 10];ma=[ 0 0 0 6 0 -6 -14];
% punctele aproximate pentru faza
wfa=[0.01 0.1 0.5 1 5 10];fa=[180 160 90 30 -75 -90];
% reprezentarea diagramei prin puncte aproximate
 
 
 
 
subplot(211);semilogx(wma,ma,'ro-');grid
title('Caracteristica de Modul');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB'); subplot(212);semilogx(wfa,fa,'ro-');grid;shg;
title('Caracteristica de Faza');ylabel('\angleH(j\omega) (degres)');
%%
% compari?ie cu diagrama din Matlab
h=tf([2 -1], [1 1 1]);w=logspace(0,3,1e2);
h1 = tf([2, -1], 1);
[m,f]=bode(h, w);
mv(1:1e2,1)=m(:,:,:);fv(1:1e2,1)=f(:,:,:); subplot(211);semilogx(w,20*log10(mv),'b',wma,ma,'ro-');grid title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB'); subplot(212);semilogx(w,fv,'b',wfa,fa,'ro-');grid;shg; title('Phase characteristics');
xlabel('\omega (rad/sec)'); ylabel('\angleH(j\omega) (degres)');
%%
%H=tf([2 0],[1 7]);
%bode(H);
clear;clc
% punctele aproximate pentru modul
wma=[0.01 0.1 0.5 1 2 5 10];ma=[ 0 0 0 6 0 -6 -12];
% punctele aproximate pentru faza
wfa=[0.01 0.1 0.5 1 5 10];fa=[180 160 90 30 -75 -90];
% plotting the approximations
subplot(211);semilogx(wma,ma,'ro-');grid
title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB');
subplot(212);semilogx(wfa,fa,'ro-');grid;shg;
title('Phase characteristics');ylabel('\angleH(j\omega) (degres)');
%%% comparison with Bode in Matlab
h=tf([2 -1],[1 1 1]);w=logspace(0,3,1e2);
[m,f]=bode(h, w);
mv(1:1e2,1)=m(:,:,:);fv(1:1e2,1)=f(:,:,:);
subplot(211);semilogx(w,20*log10(mv),'b',wma,ma,'ro-');grid
title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB');
subplot(212);semilogx(w,fv,'b',wfa,fa,'ro-');grid;shg;
title('Phase characteristics');
xlabel('\omega (rad/sec)'); ylabel('\angleH(j\omega) (degres)');

%% e = -0.1s
h = tf(1,1,'iodelay',0.1)
h1 = tf([30 0], [1 20])
h*h1
bode(h*h1, logspace(-1,2,100));hold on;
semilogx([2.5 5 10 20 40], [-14 -28 -57 -114 -228],'*r-')
