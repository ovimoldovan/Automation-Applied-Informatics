%% ex 1
H = tf([100], [1 15 100]);
step(H);

%% ex 2
H = tf([2], [10 3]);step(H);
%% ex 3
Hf = tf([1], [2 1]);
%Hr = 2; %a
%Hr = tf([2], [1 0]); %b
%Hr = tf([10], [1 0]); %c
Hr = tf([2], [1 0 0]); %d
t = 0:0.1:50;
H = Hf * Hr;
figure(1)
%Ho = feedback(H,1);
t2 = t.^2;
lsim(H,t2,t)
figure(2)
bodeplot(H)