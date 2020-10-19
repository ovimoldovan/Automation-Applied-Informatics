%% prob 1

H = tf(10*[1 15], [1 3 100]);

subplot(131);
step(H);
subplot(132);
Te=0.1;% establish sampling period 
Hd=c2d(H,Te,'zoh')
step(Hd)
subplot(133);
reprezentare(Hd)