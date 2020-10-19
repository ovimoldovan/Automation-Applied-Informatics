
t = -30:0.1:30;
x = @(t)(1*sin(t +  64) + 2*(rand(1, length(t))-0.5)/10);
plot(t,x(t));shg