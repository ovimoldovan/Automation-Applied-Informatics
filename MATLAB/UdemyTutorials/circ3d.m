clc
clear all
%--------
theta = linspace(-pi,3*pi,200); %spirala frumoasa
x = 5*cos(theta);
y = 5*sin(theta);
z = linspace(1,10,200);
plot3(x,y,z);
hold on
plot3([0 0], [0 0], [1 10]); %linie
z1 = linspace(2,11,200);
plot3(x,y,z1);
for k=1:1:200 %liniute
    plot3([x(k) x(k)], [y(k) y(k)], [z(k) z1(k)]);
end
for m=1:10:200 %scari
    plot3([0 x(m)], [0,y(m)], [z(m) z(m)]);
end