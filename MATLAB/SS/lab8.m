%% 1 b 
sx = -7; ex = 0;
sy = 0; ey = 7;
dtx = sx:ex; dty = sy:ey;
dtw = sx + sy:ex+ey;
x = (-1).^dtx;
y = ones(1,  ey-sy+1);
w = conv(x,y);
subplot(3,1,1);stem(dtx,x);xlabel('n');ylabel('x[n]');
subplot(3,1,2);stem(dty,y);xlabel('n');ylabel('y[n]');
subplot(3,1,3);stem(dtw,w);xlabel('n');ylabel('w[n]');
%% computing the convolution for alpha = 0.8
h= @(n)(n>=0);
x = @(n)((0.8.^n).*(n>=0));
n = 0:15;
y = conv(x(n), double(h(n)));
stem(n,y(1:length(n)));grid;xlabel('n');ylabel('y[n]')

%% analytic evaluation of the convolution sum

x = @(n)(n>=1);
v = @(n)((0.5).^(n-1)).*(n>=0);
sx = 1; ex = 20; dtx = sx:ex;
sv = 0; ev = 19; dtv = sv:ev;
dty = sx+sv:ex;
y= conv(double(x(dtx)),v(dtv));
subplot(3,1,1);stem(dtx,x(dtx));xlabel('n');ylabel('x[n]');
subplot(3,1,2);stem(dtv,v(dtv));xlabel('n');ylabel('v[n]');
subplot(3,1,3);stem(dty, y(1:length(dty)));xlabel('n');ylabel('x[n]'); hold on;
y2 = (4 - ((0.5).^(dty-2))).*(dty>=1);
stem(dty, y2, '*r'); xlabel('n'); ylabel('y[n]');
legend('y', 'y2');

%% ex 1 a
x = @(n)(n - (n>=2));
v = @(n)((0.2).^(n)).*(n>=0);
sx = 0; ex = 2; dtx = sx:ex;
sv = 0; ev = 10; dtv = sv:ev;
dty = sx+sv:ex;
y= conv(double(x(dtx)),v(dtv));
subplot(3,1,1);stem(dtx,x(dtx));xlabel('n');ylabel('x[n]');
subplot(3,1,2);stem(dtv,v(dtv));xlabel('n');ylabel('v[n]');
subplot(3,1,3);stem(dty, y(1:length(dty)));xlabel('n');ylabel('x[n]'); hold on;
%y2 = (4 - ((0.5).^(dty-2))).*(dty>=1);
%stem(dty, y2, '*r'); xlabel('n'); ylabel('y[n]');
%legend('y', 'y2');

%% ex 2

%u = @(n)(1.*(n>=0) + 0.*(n<0));
d = @(n)(1.*(n==0) + 0.*(n~=0));

x = @(n)(d(n) + 2.*d(n-1) - d(n-3));
h = @(n)(2*d(n+1) + 2*d(n-1));

sx = -1; ex = 5;
sh = -2; eh = 2;
dtx = sx:ex;
dth = sh:eh;

subplot(5,1,1);stem(dtx,x(dtx));
subplot(5,1,2);stem(dth,h(dth));
y1 = conv(x(dtx),h(dtx));
y2 = conv(x(dtx+2,h(dtx)));
y3 = conv(x(dtx), h(dtx+2));

dy = sx+sh:ex+eh;

subplot(5,1,3);stem(dy,y1(length(dy)));
subplot(5,1,4);stem(dy,y2(length(dy)));
subplot(5,1,5);stem(dy,y3(length(dy)));

