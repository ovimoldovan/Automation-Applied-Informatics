load('/Users/ovi/Documents/MATLAB/SI_Project/proj_fit_02.mat');
X1 = id.X{1,1};
X2 = id.X{2,1};
N = length(X1);
t = 1:N;
phi=ones(N,11);
y=ones(N*N,1);

Y = id.Y;
for i=1:N
    for j=1:N
       phi((i-1)*N+j,:)=[X1(j) X2(i) X1(j)*X2(i) 1 X1(j)^2 X2(i)^2 X1(j).^3 X2(i).^3 X1(j).^2*X2(i) X1(j)*X2.^2 X1(j).^2*X2(i)^2];
       y((i-1)*N+j)=Y(j,i);
    end
end

%[X,Y] = meshgrid(-2:0.01:2);  

size(phi)
size(y)
theta=phi\y;
%f = [theta(1) theta(2) theta(3) theta(4) theta(5) theta(6)];
%f = @(x1,x2)(theta(1).*x1 + theta(2).*x2 + theta(3).*x1.*x2 + theta(4) + theta(5).*x1.^2 + theta(6).*x2.^2);
%plot(X1,Y(1,:), 'r', X1,a);shg
%plot(X1,X2,f(x1,x2));shg
%f = (theta(1).*X1 + theta(2).*X2 + theta(3).*X1.*X2 + theta(4) + theta(5).*X1.^2 + theta(6).*X2.^2);

for i=1:N
    for j=1:N
       f(i,j)=[theta(1).*X1(i) + theta(2).*X2(j) + theta(3).*X1(i).*X2(j) + theta(4) + theta(5).*X1(i).^2 + theta(6).*X2(j).^2 + theta(7)*X1(i).^3 + theta(8)*X2(j).^3 + theta(9)*X1(i).^2*X2(j) + theta(10)*X1(i)*X2.^2+ theta(11)*X1(i).^2*X2(j)^2];
    end
end

size(f)
surf(X1,X2,f);hold on;
surf(X1,X2,Y)