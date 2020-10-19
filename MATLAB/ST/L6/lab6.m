%% 
Hd = tf([1,2], conv([1,1],[1,-3]));
Hr = 1;
Hdes = Hd * Hr
rlocus(Hdes);grid;

%%
k = [2, 4, 8, 10.5, 15]
t = 0:0.2:20;
for i = 1:length(k)
    Ho = feedback(k(i)*Hd, Hr);
    step(Ho); title(['k=', num2str(k(i))]);
    grid;shg;pause(1);
end

%%
Hd = tf( conv([1, -1], [1, -2]), conv([1,1], [1, 8]));
Hdes = Hd;
rlocus(Hdes); grid

