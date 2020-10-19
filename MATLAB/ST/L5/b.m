%% 3d
%mesh(tm, ym)
%% a
k = 3;
wn = 4;
xi = [0, 0.06, 0.1:0.1:1];
%timpul de simulare
tfin = 5/wn/xi(2);
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
mesh(ym, tm); shg

%% b
k = 3;
wn = 10:10:100;
xi = 0.3;
%timpul de simulare
tfin = 5/max(wn)/xi;
t = 0:tfin/100:tfin; %101 valori
l = length(t);
lwn = length(wn); ym = zeros(l,lxi);
for i=1:lwn
    y = step(k*wn(i).^2, [1, 2*xi.*wn(i), wn(i).^2], t); %vector coloana de lungimea vectorului timp
    ym(:,i) = y;
    tm(:,i) = t'; %pentru mesh 3d
end
plot(ym);legend(num2str(xi'));shg
%mesh(tm, ym)
mesh(ym'); shg