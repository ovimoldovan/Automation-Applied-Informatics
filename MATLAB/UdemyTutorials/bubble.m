r1 = 5;
theta = linspace(-pi,pi,400);
for k=1:1:40
    x = r1*k*cos(theta);
    y = r1*k*sin(theta);
    plot(x,y,'g');
    axis([-400 400 -400 400]);
    pause(0.2);
    hold on;
end