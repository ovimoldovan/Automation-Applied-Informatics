%% dahlin

H = tf([0.2], conv([50, 1], [3, 1]), 'iodelay', 2);
Hz = c2d(H, 1, 'zoh');
lambda = 50/4;

