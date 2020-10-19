%% 1
w = 2e15;
T = 2*pi/w;
t=0:T/100:3*T;
u=sin(w*t);
plot(t,u);grid
%% 2 scara logaritmica
log10((1:10)')