Hf = tf([1.2], [20, 1], 'iodelay', 3)
Hfz = c2d(Hf, 1, 'zoh')

%% Kalman
k = 1/0.05852;
Q = k * 0.9512;
Hc = tf([17.08, -16.25, 0, 0, 0], [1 0 0 -1], 1)
Ho = feedback(Hfz * Hc, 1)
step(Ho);hold on; step(Hf)
figure()
%% Dead-beat
%Hc = tf([1, -0.9512, 0, 0, 0], [0.05852, 0, 0, 0, -0.05852], 1);
%Ho = feedback(Hfz * Hc, 1);
%step(Ho);hold on; step(Hf)
Ho = filt([0 0 0 0 0.9415 0.0585],1,1)
step(Ho);hold on; step(Hf)