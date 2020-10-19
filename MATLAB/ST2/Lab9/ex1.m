%% figura 3
f=1; % frecventa semnalului
n=10; % numar de esantioane
Te1=1/f/n ; % perioada de esantionare
t=0:Te1:1; % timpul de simulare esantionat cu Te1 
x=cos(2*pi*f*t); % functia cosinus de frecventa f 
subplot(3,2,[1,3,5]); stem(t,x);hold;stairs(t,x,'r');hold;% comparatie stem vs stairs
legend('stem','stairs');
title('stem vs. stairs'); ylabel('cos(2\pift)');xlabel('timp (sec.)')
Te2=1/f/20;% 20 de esantioane
Te3=1/f/100;% 100 de esantioane
t2=0:Te2:1;t3=0:Te3:1;
x2=cos(2*pi*f*t2);% semnal cu 20 de esantioane pe o perioada 
x3=cos(2*pi*f*t3);% semnal cu 100 de esantioane pe o perioada
% se reprezinta grafic semnalele
subplot(3,2,2);stem(t,x);title('10 esantioane'); 
subplot(3,2,4);stem(t2,x2);title('20 de esantioane'); 
subplot(3,2,6);stem(t3,x3);title('100 de esantioane');