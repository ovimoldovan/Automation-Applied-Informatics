k = 5;
T = 10e-2; 
tm = 10e-3;
H = tf(k, [T,1])
bode(H)

wc = 500;
y = pi - atan(500*10e2) - 500*10e-3