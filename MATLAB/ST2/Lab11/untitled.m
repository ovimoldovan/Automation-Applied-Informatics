
H = tf(1,[1,3,2]);
T = 0.1;
Hd = c2d(H,T,'tustin');
step(Hd);

%% variabile simbolice
syms s z T;
s = 2/T*(z-1)/(z+1)
H = 1/(s^2+3*s+2)
H1 = simplify(H)
pretty(collect(H1,'z'))
%%
H = tf(1,[1,3,2]);
T = 0.2;
Hd = c2d(H,T,'tustin');
b2 = 1e-2;b0=b2;b1 = 2*b2;
a2 = 4.62;a1 = -7.96; a0 = 3.42;
Te = 0.2;
y(1) = b2/Te;
y(2) = (-a1*y(1)+b1/Te)/a2;
y(3) = (-a1*y(2)-a0*y(1) + b0/Te)/a2;
for k=4:30
    y(k) = (-a1*y(k-1) - a0*y(k-2))/a2;
end

t = 0:Te:29*Te;
plot(t,y,'r');hold on;impulse(Hd);hold;