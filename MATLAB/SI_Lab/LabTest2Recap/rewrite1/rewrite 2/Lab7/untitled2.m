u1 = 1.5 * ones(1,50);
u2 = 0.5 * ones(1,50);
u3 = 2 * ones(1,50);
t = 1:150;
u = [u1, u2, u3];
%plot(t,u)

val1 = system_simulator(3,u')
%plot(val1)
u = val1.u;
y = val1.y;

N = 300; a = 0.5; b = 1; m = 3;

u2 = prbs(N,m,a,b)';
%u2 = stairs(u2);
val2 = system_simulator(3,u2);
plot(val2);

arx1 = arx(val2, [2 2 1]);
compare(arx1,val2)
%% 
N = 300; a = 0.5; b = 1; m = 10;

u2 = prbs(N,m,a,b)';
%u2 = stairs(u2);
val2 = system_simulator(6,u2);
plot(val2);

arx1 = arx(val2, [2 2 1]);
compare(arx1,val2)