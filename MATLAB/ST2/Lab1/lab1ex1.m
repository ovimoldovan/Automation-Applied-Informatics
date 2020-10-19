%% reprezentare in scara logaritmica
fsl=logspace(-2,5,1e2);
semilogx(fsl),
ones(1,length(fsl)),'b',0.033,1,'r*',54e3,1,'r*',2,1,'r*');
grid
text(0.033,1.2,'0.033Hz');
text(54e3,1.2,'54kHz')
text(2,1.2,'2Hz');
axis([1e-2,1e5,0,1.5])
set(gcf,'units','normalized','outerposition',[0 0 1 1])
shg
%% se poate face distinc?ie între 0.033Hz ?i 2Hz?
%% Observa?i repetarea modelului gridurilor pe fiecare
decada!