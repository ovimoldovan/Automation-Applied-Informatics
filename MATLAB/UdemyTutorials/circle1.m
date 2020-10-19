theta = linspace(-pi,pi,400);
r1 = 5;
x1 = r1*cos(theta);
y1 = r1*sin(theta);
%plot(x1,y1,'r');
%hold on;
r2 = 15;
x2 = r2*cos(theta);
y2 = r2*sin(theta);
plot(x1,y1,'r',x2,y2,'g');
hold on;
%------
for k=1:10:1
    plot(x1(k), x2(k));
    pause(0.2);
end