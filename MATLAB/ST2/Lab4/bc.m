clear;clc
% punctele aproximate pentru modul
wma=[1 20 40 70 1e3];ma=[5 5 0 -6 -6];
% punctele aproximate pentru faza
wfa=[2 7 20 70 200 700 1e3];fa=[0 -15 -35 -45 -30 -5 0];
% reprezentarea diagramei prin puncte aproximate
 
 
 
 
subplot(211);semilogx(wma,ma,'ro-');grid
title('Caracteristica de Modul');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB'); subplot(212);semilogx(wfa,fa,'ro-');grid;shg;
title('Caracteristica de Faza');ylabel('\angleH(j\omega) (degres)');
%%
% compari?ie cu diagrama din Matlab
h=tf(0.5*[1 70],[1 20]);w=logspace(0,3,1e2);
[m,f]=bode(h, w);
mv(1:1e2,1)=m(:,:,:);fv(1:1e2,1)=f(:,:,:); subplot(211);semilogx(w,20*log10(mv),'b',wma,ma,'ro-');grid title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB'); subplot(212);semilogx(w,fv,'b',wfa,fa,'ro-');grid;shg; title('Phase characteristics');
xlabel('\omega (rad/sec)'); ylabel('\angleH(j\omega) (degres)');
