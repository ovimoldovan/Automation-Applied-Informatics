Tu = 5; wn = 2*pi/Tu;
t = 0:Tu/50:2*Tu;
H = tf([3],[1 2]);
u = square(wn*t);
%u = @(t)(1.*(t<=1/2) + 0.*(t<=5))
lsim(H,u,t);shg