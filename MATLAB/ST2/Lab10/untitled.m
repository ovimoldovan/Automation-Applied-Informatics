Hdes = tf(300, [1,400]); %open loop transfer function
rlocus(Hdes)
figure(2)
Te = 1/400/2;
Hdesd = c2d(Hdes,Te,'zoh');
%the discrete open loop tf
zpk(Hdesd)
rlocus(Hdesd)
%% 
clear all;
close all;
k=[1 10 25 26.7] ;
T=1/400/10 ; sc=tf(300, [1,400]);
sd=c2d(sc, T,'zoh'); % open loop pulse transfer function 
text={'undamped','underdamped','critically damped','overdamped'};
for i=1 :length(k)
    sd_cl=feedback(k(i)*sd,tf(1,1));% closed loop pulse transfer function 
    sc_cl=feedback(k(i)*sc,tf(1,1));% closed loop transfer function 
    subplot(2,2,i);step(sd_cl,sc_cl); mes=['k=',num2str(k(i)),',',text{i}];title(mes);
end