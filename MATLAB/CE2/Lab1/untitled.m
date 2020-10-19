%H = tf([15], conv([conv([1,0], [1 1])], [1 5]))
%H = tf([15], [1 6 5 0])
H = tf([25], [1 6 5 0])
Ho = feedback(H,1)
step(Ho)
H1 = c2d(H,0.1, 'tustin')
H2 = c2d(H,0.5,'tustin')
H3 = c2d(H,1,'tustin')

Ho1 = feedback(H1,1)
Ho2 = feedback(H2,1)
Ho3 = feedback(H3,1)
subplot(311)
step(Ho1);
subplot(312)
step(Ho2);
subplot(313)
step(Ho3)

%%
H1 = c2d(H,0.1, 'tustin')
H2 = c2d(H,0.5,'tustin')
H3 = c2d(H,1,'tustin')

Ho1 = feedback(H1,1)
Ho2 = feedback(H2,1)
Ho3 = feedback(H3,1)
subplot(311)
impulse(Ho1);
subplot(312)
impulse(Ho2);
subplot(313)
impulse(Ho3)

%% 

H1 = c2d(H,0.1, 'tustin')
H2 = c2d(H,0.5,'tustin')
H3 = c2d(H,1,'tustin')
t1 = 0:0.1:30;
t2 = 0:0.5:50;
t3 = 0:1:50;




Ho1 = feedback(H1,1)
Ho2 = feedback(H2,1)
Ho3 = feedback(H3,1)

subplot(311)
plot(lsim(Ho1, t1, t1))
subplot(312)
plot(lsim(Ho2, t2, t2))
subplot(313)
plot(lsim(Ho3, t3, t3))

%%
H = tf([15] * [1 3 3 1], [42 -21 -9 0], 1)
step(feedback(H,1))
figure();
H = tf([15], [1 6 5 0])
H = c2d(H, 1, 'tustin')
step(feedback(H,1))