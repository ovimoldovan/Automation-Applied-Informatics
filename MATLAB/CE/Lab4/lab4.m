overshoot = 0.07;
zeta = abs(log(overshoot))/sqrt(pi^2 + (log(overshoot))^2)
ts = 4;
wn = 4/ts/zeta
cv = wn/2/zeta
cvstelat = 1.6
banda = wn*sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))
Ho = tf([wn^2], [1 2*wn*zeta wn^2]);
%zc = 0.0459;pc = 0.0482;
deltaOvershoot = 0.03;
pc = deltaOvershoot/(2*zeta/wn - 1/cvstelat)
%zc = pc/1+deltaOvershoot
zc = pc/1.05
Hoc = Ho * tf((pc/zc) * [1 zc], [1 pc])
step(Hoc);
Tf = 5; Kf = 2;
%Hr = tf((wn^2/zeta)* [Tf 1], Kf *[1/2/zeta/wn 1]);
num = [Tf Tf*zc zc];
den = [zc (2*zeta*wn*zc + pc*zc) (wn^2*zc-wn^2*pc+2*zeta*wn)];
Hr = tf(num,Kf*den)
t = 0:0.1:10;
figure(2)
lsim(Hoc,t,t)
Hr = zpk(minreal(Hr))


figure(3)
subplot(311)
step(Hr)

subplot(312)
Tf = Tf + 20/100 * Tf
num = [Tf Tf*zc zc];
den = [zc (2*zeta*wn*zc + pc*zc) (wn^2*zc-wn^2*pc+2*zeta*wn)];
Hr = tf(num,Kf*den)
step(Hr)
subplot(313)
Kf = 3;
num = [Tf Tf*zc zc];
den = [zc (2*zeta*wn*zc + pc*zc) (wn^2*zc-wn^2*pc+2*zeta*wn)];
Hr = tf(num,Kf*den)
step(Hr)