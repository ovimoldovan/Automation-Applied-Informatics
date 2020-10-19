%% ex
H = tf(400,conv([1 2 0], [1 50]));
nyquist(H);
%% H1
H1 = tf(4, [0.3 1 1]);
nyquist(H1);
w = 0.3;
T = 2*pi/w;
t = 0:T/50:T*10;
u = sin(w*t);
%lsim(H1,u,t);grid;shg
%% H2
H2 = tf([1 0 4], [0.3 1 1]);
nyquist(H2);
w = 0.3;
T = 2*pi/w;
t = 0:T/50:T*10;
u = sin(w*t);
lsim(H2,u,t);grid;shg
%% H3 
H3 = tf([1 0 0], [0.3 1 1]);
nyquist(H3);
%% H4
H4 = tf([1 0], [0.3 1 1]);
nyquist(H4);