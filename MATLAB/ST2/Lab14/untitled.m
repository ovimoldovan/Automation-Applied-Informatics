A = [-3 -2; 1 0];
B = [1;0];
C = [4 1];
D = [0];

H = ss(A,B,C,D)
H = tf(H)

p = eig(A) + 1/20*eig(A);

Kx = acker(A,B(:,1), p)

step(H);hold on;

Co = ctrb(A,B(:,1));
R = rank(Co)

Ar = A - B(:,1) * Kx;
Fx=inv((C*inv(-A)*B(:,1))); 

H2 = ss(Ar, B, C, D);
H2 = tf(H2);

Fx=inv((C*inv(-Ar)*B(:,1)))


step(H2)