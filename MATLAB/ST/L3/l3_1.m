%% 1 
R = 1e3; L = 20; C = 1e-6;
A = [-R/L, -1/L ; 1/C, 0];
B = [1/L;0];Cs = [0, 1]; D = 0;
step(A,B,Cs,D)

%% 2 
R = 1e3; L = 20; C = 1e-6;
A = [-R/L, -1/L ; 1/C, 0];
B = [1/L;0];Cs = [0, 1]; D = 0;

sistem = ss(A,B,Cs,D);
x0 = [-0.1, 0.05];
t = 0:0.1:12;
u = zeros(1, length(t));
[y,t,x] = lsim(sistem,u,t,x0);
%subplot(211)
%plot(t,y)
%subplot(212)
%plot(t,x)

%% 3 
R = 1e3; L = 20; C = 1e-6;
A = [-R/L, -1/L ; 1/C, 0];
B = [1/L;0];Cs = [0, 1]; D = 0;
tf = 0.25;
t = 0:tf/100:tf;
sistem = ss(A,B,Cs,D);
x0 = [-0.1, 0.05];
t = 0:tf/1000:12;
u = zeros(1, length(t));
[y,t,x] = lsim(sistem,u,t,x0);


subplot(121) 
plot(x(:,1),x(:,2), 'vr');grid;
xlabel('x_1(t)');ylabel('x_2(t)')
subplot(122) 
plot(t,x(:,1));plot(t,x(:,2));

%% 4 circuit 2

R = 1e3; L = 20; C = 1e-6;
A = [-R/L, -1/L ; 1/C, 0];
B = [1/L;0];Cs = [1, 0]; D = 0;
tf = 0.25;
t = 0:tf/100:tf;
sistem = ss(A,B,Cs,D);
x0 = [-0.1, 0.05];
t = 0:tf/1000:12;
u = zeros(1, length(t));
[y,t,x] = lsim(sistem,u,t,x0);
