[t,x] = ode45(@L12_car_suspension, [0,10], [0 0 0 0]);
k=x(:,2);
l=x(:,4);
plot(t,k)
hold on
plot(t,1)
zr = 0.1*sin(20*t) + 0.03*sign(sin(5*t)) + 0.02*sign(sin(2*t));
subplot(3,1,1);
plot(t,zr)
subplot(3,1,2);
plot(t,k)
subplot(3,1,3);
plot(t,l)