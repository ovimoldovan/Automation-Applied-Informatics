H = tf([5], [10 1]);
wc = 1; yk = 60;
phase = -atand(10 * wc);
modulus = 5 / (sqrt(100 * (wc^2) + 1));
Ti = tand(-90 + yk - phase);
kp = Ti * wc / (modulus * sqrt((Ti^2) * (wc^2) +1));
Hc = tf([kp * Ti, kp],[Ti 0]);
Ho = feedback(H * Hc,1);
bode(Hc*H)
figure()
step(Ho)