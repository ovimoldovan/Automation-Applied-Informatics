%% Dataset
ku=0.9;
U21=16;
A=8;
L=15.15;
C=0.05;
Rs=5.33;

Hf=tf([1/(2*A)*sqrt(2)*ku*U21],[L*C L/Rs 1]);
bode(Hf);
%% P type controller
wt = 3.52;
VR = (sqrt((-wt^2+1.33)^2+(3.74*wt)^2))/.945;
Hr = VR;
bode(Hr*Hf);

%% PI type controller
Hf = tf([10], [1 2 8.3]);
wt = 3.38;
VR = (sqrt((-wt^2+8.3)^2+(2*wt)^2))/.945;
ti = 4/wt;
Hr = tf([VR*ti VR],[ti 0]); 
bode(Hr*Hf);
Hd = feedback(Hr*Hf,1);
step(Hd);shg

%% PI AMI type controller
Hf = tf([6.61], [1 2.2 5.55]);
wt = 2.9;
VR = (sqrt((-wt^2+5.5)^2+(2.2*wt)^2))/.945;
ti = 4/wt;
Hr = tf([VR*ti VR],[ti 0]); 
bode(Hr*Hf);
Hd = feedback(Hr*Hf,1);
step(Hd);shg

%% PD type controller
Hf = tf([10], [1 2 8.3]);
wt = 9.1;
VR = 0.32*(sqrt((-wt^2+8.3)^2+(2*wt)^2))/.945;
td = 1/(wt*0.32);
Hr = tf(VR*[td 1],[td/10 1])
bode(Hr*Hf);
%% PD typw controller Ami
Hf = tf([6.61], [1 2.2 5.55]);
wt = 9.7;
VR = (sqrt((-wt^2+5.5)^2+(2.2*wt)^2))/.945;
td = 1/(wt*0.32);
ti = 4/wt;
Hr = tf(VR*[td 1],[td/10 1])

Hd = feedback(Hr*Hf,1);
step(Hd);shg