%% 1
%x = @(t) (0.5 * cos(-pi*t)-0.5 ) .* (t<0) + (0.5 * sin(3*t) ) .* (t>0) ;
T = 2;
x = @(t) (t<=0).*(-sin(2*pi/T*t)) + (t>0).*sin(2*pi/T*t);
fplot(x, [-4 4]);shg

%% conv 
u = @(t) 1 .* (t>0) + 0 .* (t<0);
n = -6:1:6;
%fplot(u, [-1 1])
x = @(n)(u(n) - u(n-10));
y = @(n)(0.1.^n .* u(n));
figure;stem(n,x(n))
figure;stem(n,y(n))
a = conv(u(n), y(n));
nc = -6:0.5:6;
figure;stem(nc,a)

%% Sub 2 ex 2 a)
clear
n1 = -5; n2 = 15; n = n1: n2;
u = @(n) (n>=0) - (n>=10);
stem(n, u(n)); shg
grid

%% Sub 2 ex 2 b)
n1 = -5; n2 = 15; n = n1: n2;
u = @(n)(n>=0);
y = @(n)(0.1.^n).*u(n);
stem(n,y(n));

%%
a=conv(+u(n),+y(n));
nc=n1:0.5:n2;
stem(nc,a);

%% sub 1 ex 1
n = -6:6;
x = (n>=-4).*(-n/2).* (n<=4)
stem(n,x);shg
%% ex 2
n = -10:10;
d = @(n) (n==0) - (n==1) + (n==4);
stem(n,d(n));shg

%% colocviu astia
img = imread('circles.png');
imshow(img);shg

%b
H = fspecial('disk');
imshow(imfilter(img,H));

%% ex 
img1 = imread('peppers.png');
imshow(img1);
H = fspecial('motion');
imshow(imfilter(img1, H));shg