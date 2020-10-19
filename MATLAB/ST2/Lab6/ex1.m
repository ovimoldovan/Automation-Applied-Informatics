%% ex 1
k = 1; tm_m = 0;
Hdes = tf(k,[1,3,0],'iodelay',tm_m)
%nyquist(Hdes);text(-0.2,1,'Ho stable for k from 0 to infinity');
open('fig1.fig')

%% ex 2
figure(1)
k = 1; tau_m = 2.5;
Hdes = tf(k,[1,3,0],'iodelay',tau_m)
%nyquist(Hdes);text(-1,1,'Ho stable for k from 0 to 1.6949')
open('fig21.fig')

figure(2)

%step(feedback(Hdes,1));title('Step response for the stable case')
%saveas('fig','fig22.fig')
open('fig22.fig')
figure(3)
k = 1.6936;
tau_m = 2.5;
Hdes = tf(k,[1,3,0],'iodelay',tau_m)
%step(feedback(Hdes,1));title('stability limit');
%saveas('fig','fig23.fig')
open('fig23.fig')

w = 0:0.1:1;
plot(w,atan(w/3),'k', w,pi/2-2.5*w,'r');
%grid;title('Solutia ecuatiei transcendente');
%plot(0.5,pi/12,'*r');
%text(0.5,pi,'\omega_pi=0.55')
Mhdes = 1/0.55/sqrt(0.55^2+9)

%% ex 3

k = 5; tau_m = 0.745;
Hdes = tf(k,[1,3,0],'iodelay',tau_m)
nyquist(Hdes)

sqrt(roots([1,9,-25]))