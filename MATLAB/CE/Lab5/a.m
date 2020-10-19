%% a 
H = tf(3.5, [0.5 1 0])
bode(H);hold on;
overshoot = 0.085;
wf = 2;
ts = 15
zeta = abs(log(overshoot))/sqrt(pi^2 + (log(overshoot))^2)
wn = 4/ts/zeta
wc = wn/2/zeta
A = 1/4/zeta/zeta
Adb = mag2db(abs(A))
F = 1.85;
FN = F - Adb
FNdb = db2mag(-FN)
Hp = (FNdb) * H;
bode(Hp)
figure(2)
Hpf = feedback(Hp,1)
step(Hpf)

%% b
close all;
H = tf(3.5, [0.5 1 0])
bode(H);hold on;
overshoot = 0.10;
wf = 2;
ts = 15
zeta = abs(log(overshoot))/sqrt(pi^2 + (log(overshoot))^2)
wn = 4/ts/zeta
wc = 2.28;
wz = wc/10;
cv = 9.86;
cvstelat = 3000;
wp = cv/cvstelat * wz
Q = mag2db(cvstelat)
QV = Q - cv

Tz = 1/wz;
Tp = 1/wp;
PI = QV * tf([Tz, 1], [Tp, 1])

Ho = PI * H;
bode(Ho)
figure(2)
Hof = feedback(Ho,1)
step(Hof)


