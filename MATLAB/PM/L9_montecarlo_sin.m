N = 80;
a = rand(1,N);
z = a * pi/2;
I1 = pi/(2*N)*sum(sin(z));
display(I1);
I2 = (pi^2)/(8*N)*sum(sin(z)/z);
display(I2);