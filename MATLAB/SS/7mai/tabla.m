x1 = linspace(-pi, 0);
x2 = linspace(0, pi);
x = [x1, x2];
y1b = -pi/2.*ones(size(x1,2),1);
y2b = pi/2.*ones(size(x2,2),1);
y = [y1b; y2b];
yfb1 = 2.*sin(x);
yfb2 = 2.*sin(x) + 2/3.*sin(3*x);
yfb3 = 2.*sin(x) + 2/3.*sin(3*x) + 2/5.*sin(5*x);
yfb4 = 2.*sin(x) + 2/3.*sin(3*x) + 2/5.*sin(5*x) + 2/7.*sin(7*x);
plot(x,y,'b',x,yfb1,'r',x,yfb2, 'g', x, yfb3, 'c', x,yfb4,'k');
axis tight; grid on; hold on; 
legend('f(x)', 'AIF', 'SIIAF', 'SIIIAF', 'SIVAF')