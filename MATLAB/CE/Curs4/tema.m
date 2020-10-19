zetac = 0.05;
zeta2=0.05;
zeta = abs(log(zeta2))/sqrt(pi^2+(log(zeta2))^2);
wn_zeta = 2.5;
wn = wn_zeta/sqrt(1-zeta^2)
essv = 2*zeta/wn
ts = 4/zeta/wn
