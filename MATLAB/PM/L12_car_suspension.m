function dx = L12_car_suspension(t,x)

Ms = 300;
Ks = 28000;
Bs = 2000;
Mu = 30;
Kt = 21000;
a=[0,-Kt, 0, 0;
    1/Mu, -Bs/Mu, -1/Mu, Bs/Mu; 
    0,Ks, 0, -Ks; 
    0, Bs/Ms, 1/Ms, -Bs/Ms];
b = [Kt; 0; 0; 0];
zr = 0.1*sin(20*t)+0.03*sign(sin(t*5)) + 0.02*sign(sin(2*t));


dx=a*x+b*zr;
end

