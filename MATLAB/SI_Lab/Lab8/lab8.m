clear all;
close all;
u1 = 0.5 * ones(50,1);
u2 = 1.5 * ones(50,1);
u3 = 0.75 * ones(50,1);


u = [u1; u2; u3];

data = system_simulator(3,u);

u = data.u;
y = data.y;
t = 1:150;

plot(t,y)
figure(2)
N = 300; a = 0.5; b = 1; m = 3;

t = 1:N;

u2 = prbs(N,m,a,b);

stairs(t,u2);

figure(3)
id = system_simulator(3,u2');

uid = id.u;
yid = id.y;

tid = 1:length(uid);

plot(id)
figure(4);
H = arx(id, [5 5 1]);
%Hsim = lsim(H, uid);

%plot(tid,yid,tid,Hsim);

compare(H,data)

figure(5)
% m = 10;
N = 300; a = 0.5; b = 1; m = 10;
u3 = prbs(N,m,a,b);
id2 = system_simulator(3,u3');
H2 = arx(id2,[5 5 1]);

compare(H2, data)

figure(6)
white_noise1 = xcorr(detrend(u2));
plot(white_noise1);
figure(7)
white_noise = xcorr(detrend(u3));


plot(white_noise);


figure(8)

U = idinput(3,'PRBS')
N = 300; a = 0.5; b = 1; m = 10;
ID = system_simulator(3,U');
Ha = arx(ID,[5 5 1]);
compare(Ha,data);


