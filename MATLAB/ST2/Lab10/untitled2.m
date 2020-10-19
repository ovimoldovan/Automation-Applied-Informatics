H = tf([1 2], conv([4 1],[1 -1]));
Te = 0.1;
subplot(221); %Ho is stable for k going from 3 to infinity
rlocus(H)
Hp = zpk(H);
Hp = c2d(H,Te,'zoh');
subplot(222);
rlocus(Hp)

Te = 0.5;
Hp = c2d(H,Te,'zoh');
subplot(223);
rlocus(Hp)

Te = 2;
Hp = c2d(H,Te,'zoh');
subplot(224);
rlocus(Hp)
