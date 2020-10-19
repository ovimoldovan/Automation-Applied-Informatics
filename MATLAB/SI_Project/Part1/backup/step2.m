x = 0:0.01:2;
Y = exp(x);
plot(x,Y, 'r');hold on;
Y = Y';
o = ones(size(x));
PHI = [ (x.^2)' , (x)',   o'];

theta = PHI\Y;
a = theta(1); %a = 1.46;
b = theta(2); %b = 0.08;
c = theta(3); %c = 1.16;
f = @(x)(a*x.^2 + b*x + c);
plot(x,f(x))