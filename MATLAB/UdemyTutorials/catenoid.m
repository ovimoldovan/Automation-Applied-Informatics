u = linspace(-pi,pi,100);
v = linspace(-pi/2,pi/2,100);
[mU,mV]=meshgrid(u,v);



alpha = pi/2;  %spune unghiu
mX=cos(alpha)*sinh(mV).*sin(mU)+sin(alpha)*cosh(mV).*cos(mU);
mY=-cos(alpha)*sinh(mV).*cos(mU)+sin(alpha)*cosh(mV).*sin(mU);
mZ=mU*cos(alpha)+mV*sin(alpha);
mesh(mX,mY,mZ);
