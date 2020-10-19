clear all;
close all;
%% part 1
u1 = 1.5*ones(50,1);
u2 = 0.5*ones(50,1);
u3 = 0.75*ones(50,1);
u = [u1;u2; u3];

data = system_simulator(3,u);

u = data.u;
y = data.y;
t = 1:150;

plot(t,y)

%% part 2
N = 300; a = 0.5; b = 1; m = 3;
t=1:N
u2 = prbs(N,m,a,b)
stairs(t,u2)

%% part 3

id = system_simulator(3,u2');
uid = id.u;
yid = id.y;
tid = 1:length(uid);
H = arx(id, [5 5 1])

compare(id,H)

%% part 4
N = 300; a = 0.5; b = 1; m = 10;
t=1:N
u3 = prbs(N,m,a,b)

id2 = system_simulator(3,u3');
H2 = arx(id2, [5 5 1])
compare(id2,H2)

%% part 5

white_noise1 = xcorr(detrend(u2));
%plot(white_noise1)
white_noise2 = xcorr(detrend(u3));
plot(white_noise2)

%% part 6 optionally
U = idinput(3, 'PRBS');
N = 300; a = 0.5; b = 1; m = 10;
ID = system_simulator(3,U');
Ha = arx(ID, [5 5 1]);
compare(Ha,data)

%% din lab
U = idinput(3,'PRBS')
N = 300; a = 0.5; b = 1; m = 10;
ID = system_simulator(3,U);
Ha = arx(ID,[5 5 1]);
compare(Ha,data);