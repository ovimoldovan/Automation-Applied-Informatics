%% 1
eye(10) %identity matrix
a = [1 2 3];
a.^3;
%% 2 
t = 0:0.1:10;
v = sin(t);
w = cos(t);
plot(t,v, 'r*')
hold on
plot(t,w)
hold off
%plot(t,v,t,w);
a = [2 3 4];
b = a' %transpose 