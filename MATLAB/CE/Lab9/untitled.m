H = tf(2*[1], [50 15 1], 'iodelay', 3);
bode(H, 'b'); hold on;
figure()

Hpi = tf(1.12 * [1], [26 0]);

Hpd = tf(0.89 * [10 1], [1 1]);

Hpid = Hpi * Hpd;

Hpid = Hpid * H;

bode(Hpi * H, 'r');
bode(Hpd * H, 'g');
hold off;
figure(2)

Ho1 = feedback(Hpi*H, 1);
step(Ho1);

figure(3)
Ho2 = feedback(Hpd*H, 1);
step(Ho2);