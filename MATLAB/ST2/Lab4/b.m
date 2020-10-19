clear;clc
% punctele aproximate pentru modul
wma=[0.1 1 4 7];ma=[-11 -11 0 6 ];
% punctele aproximate pentru faza
wfa=[0.1 0.7 1 7 10 70 ];fa=[0 30 40 40 50 85];
% reprezentarea diagramei prin puncte aproximate
 
 
 
 
subplot(211);semilogx(wma,ma,'ro-');grid
title('Caracteristica de Modul');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB'); subplot(212);semilogx(wfa,fa,'ro-');grid;shg;
title('Caracteristica de Faza');ylabel('\angleH(j\omega) (degres)');
%%
% compari?ie cu diagrama din Matlab
h=tf(2*[1 0],[1 7]);w=logspace(-1,2,1e2);
[m,f]=bode(h, w);
mv(1:1e2,1)=m(:,:,:);fv(1:1e2,1)=f(:,:,:); subplot(211);semilogx(w,20*log10(mv),'b',wma,ma,'ro-');grid title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB'); subplot(212);semilogx(w,fv,'b',wfa,fa,'ro-');grid;shg; title('Phase characteristics');
xlabel('\omega (rad/sec)'); ylabel('\angleH(j\omega) (degres)');
%%
H=tf(20,[1 7 0]);
bode(H);