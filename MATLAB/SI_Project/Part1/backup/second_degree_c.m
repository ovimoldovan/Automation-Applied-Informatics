load('/Users/ovi/Documents/MATLAB/SI_Project/proj_fit_02.mat');
X1 = id.X{1,1};
X2 = id.X{2,1};
N = length(X1);
t = 1:N;
phi=ones(N,6);
y=ones(N*N,1);


X1val = val.X{1,1};
X2val = val.X{2,1};
Yval= val.Y;
N2=length(X1val);


Y = id.Y;
for i=1:N
    for j=1:N
       phi((i-1)*N+j,:)=[X1(j) X2(i) X1(j)*X2(i) 1 X1(j)^2 X2(i)^2];
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
       fid(i,j)=[theta(1).*X1(i) + theta(2).*X2(j) + theta(3).*X1(i).*X2(j) + theta(4) + theta(5).*X1(i).^2 + theta(6).*X2(j).^2];
    end
end

for i=1:N2
    for j=1:N2
       fval(i,j)=[theta(1).*X1val(i) + theta(2).*X2val(j) + theta(3).*X1val(i).*X2val(j) + theta(4) + theta(5).*X1val(i).^2 + theta(6).*X2val(j).^2];
    end
end

size(f);
subplot(211);
hold on;
surf(X1,X2,fid,'EdgeColor','b');
surf(X1,X2,Y,'EdgeColor','r');hold off;
subplot(212);
hold on;
surf(X1val,X2val,fval,'EdgeColor','b');
surf(X1val,X2val,Yval,'EdgeColor','r');hold off;

%mse
sum=0;
for i=1:N
    for j=1:N
        sum=sum + (Y(i,j)-fid(i,j))^2;
    end
end
mse=sum/N/N
sum=0;
for i=1:N2
    for j=1:N2
        sum=sum + (Yval(i,j)-fval(i,j))^2;
    end
end
mseval=sum/N2/N2
