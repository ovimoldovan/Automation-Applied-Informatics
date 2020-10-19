% Indice pentru implementat: tabelele 3.1/3.2; metoda 3
% Lab 3: 3.5.1; Ex2/opt nu e necesar

Hs = tf([4.25], conv(conv([0.3, 1],[22.5, 1]),[40,1]));
step(Hs, 'g'); hold on;
yss = 4.25;
%Cohen Coon
t632index = 0.632 * yss;
t28index = 0.28 * yss;
t632=66.5;
t28=31.9;
T = 1.5 * (t632 - t28);
Tm = 1.5 * (t28 - (0.33*t632));
HsSim = tf(4.25, [T 1], 'InputDelay', Tm);
step(HsSim, 'b')
Kf = 4.25;

%% metoda 3: chien-hrones-reswich overdamped wrt the ref signal
Pkp = (T * 0.3)/(Tm*Kf)
Pti = inf;
Ptd = 0;

PIkp = (T*0.35)/(Tm*Kf);
PIti = 1.2*Tm;
PItd = 0;

PIDkp = (0.6*T)/(0.5*Tm);
PIDti = Tm;
PIDtd = 0.5*Tm;
%%  wrt disturbances
Pkp = (T * 0.3)/(Tm*Kf)
Pti = inf;
Ptd = 0;

PIkp = (T*0.6)/(Tm*Kf);
PIti = 4*Tm;
PItd = 0;

PIDkp = (0.95*T)/(0.5*Tm);
PIDti = 2.4*Tm;
PIDtd = 0.42*Tm;