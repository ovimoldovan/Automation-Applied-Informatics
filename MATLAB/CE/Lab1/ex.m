%% ex 2 
num = [5];
den = [2,1];
Hd = tf(num,den);
%Hr = 5; % Vr
Hr = tf([2 2], [1 0]); %pentru p
Hd = Hd * Hr;
Ho = feedback(Hd,1);
step(Ho);
t=0:0.1:10;
lsim(Ho,t,t)

%% ex 3
H1 = tf([1], [1 0]);
H2 = tf([1], [1 2]);
Hr = 2;

t=0:0.1:10;
Ho1 = feedback(H1*H2*Hr, 1);
Ho2 = feedback(H1*H2,Hr);
Ho3 = feedback(H2,Hr*H1);
%lsim(Ho1, Ho2, Ho3,t,t);
%step(Ho1); hold on; step(Ho2); hold on; step(Ho3); hold on

step(Ho1+Ho2+Ho3);

%% ex 4
H1 = tf([1], [20 1]);
H2 = tf([0.5], [1 0]);
Hr = 2;

Ho1 = feedback(Hr*H1, 1);
Ho2 = feedback(H1*H2, Hr);
Ho3 = feedback(H2, Hr*H1);
step(Ho1+Ho2+Ho3);
