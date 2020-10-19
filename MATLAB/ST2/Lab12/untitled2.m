Te = 1/20; H = tf([11 11 30], [1 9 26 24]);
Hd = c2d(H,Te,'tustin');
%[A,B,C,D] = tf2ss(H);
[num, den] = tfdata(Hd, 'v');
[R,P,k] = residue(num,den);
num2 = num - k * [den];
Ad = [-den(2:4); [eye(2), zeros(2,1)]];
Bd = [1; zeros(2,1)];
Cd = num2(2:4); 
Dd = k;

sd = ss(Ad,Bd,Cd,Dd, Te);
step(sd); hold; step(H); hold