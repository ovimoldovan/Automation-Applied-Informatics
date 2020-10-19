%% curs 5 example
h = tf(1, [1 1 0]);
bode(h);
figure();

step(h)
figure();
Hr = 3.98;
h = feedback(h*Hr,1);
step(h)
%bode(h)

%%
h = tf(13.55*[1 4], [1 0 0]);
bode(h);shg
figure()
h = feedback(h,1)
step(h)