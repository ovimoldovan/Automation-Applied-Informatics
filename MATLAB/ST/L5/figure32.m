%% figure 3.2
k = 3;
wn = 4;
xi = [0.01, 0.06, 0.1:0.1:1];
%timpul de simulare
tfin = 0.5/wn/xi(1);
t = 0:tfin/100:tfin; %101 valori
l = length(t);
lxi = length(xi); ym = zeros(l,lxi);
for i=1:length(xi)
    y = step(k*wn^2, [1, 2*xi(i)*wn, wn], t); %vector coloana de lungimea vectorului timp
    ym(:,i) = y;
    tm(:,i) = t'; %pentru mesh 3d
end
plot(ym);legend(num2str(xi'));shg
%mesh(tm, ym)
%mesh(ym, tm); shg

