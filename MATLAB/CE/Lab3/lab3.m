%% a 
clc
zeta = abs(log(0.15))/sqrt(pi^2 + (log(0.15))^2)
ts = 20;
wn = 4/ts/zeta
cv = wn/2/zeta
banda = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))
Ho = tf([wn^2], [1 2*wn*zeta wn^2]);
step(Ho);
Tf = 2; Kf = 2;
syms s;
Hr = tf((wn/2/zeta)* [Tf 1], Kf *[1/2/zeta/wn 1]);
%zpk(Hr);

%% b
clc
zeta = abs(log(0.15))/sqrt(pi^2 + (log(0.15))^2)
ts = 5;
wn = 4/ts/zeta
cv = wn/2/zeta
banda = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))
Ho = tf([wn^2], [1 2*wn*zeta wn^2]);
step(Ho);
Tf = 2; Kf = 2;
syms s;
Hr = tf((wn/2/zeta)* [Tf 1], Kf *[1/2/zeta/wn 1]);
%% c
%clc
overshoot = 0.075;
zeta = abs(log(overshoot))/sqrt(pi^2 + (log(overshoot))^2)
ts = 6;
wn = 4/ts/zeta
cv = wn/2/zeta
banda = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))
Ho = tf([wn^2], [1 2*wn*zeta wn^2]);
step(Ho);
Tf = 2; Kf = 2;
Hr = tf((wn/2/zeta)* [Tf 1], Kf *[1/2/zeta/wn 1]);