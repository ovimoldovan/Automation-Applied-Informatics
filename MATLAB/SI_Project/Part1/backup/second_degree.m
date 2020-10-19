load('/Users/ovi/Documents/MATLAB/SI_Project/proj_fit_02.mat');
X1 = id.X{1,1};
X2 = id.X{2,1};
N = length(X1);
t = 1:N;
N2=round(N/2);
phi=ones(N2*N,6);
y=ones(N2*N,1);

for i=N2:N
    x12(i-N2+1)=X1(i);
    x22(i-N2+1)=X2(i);
end
for i=1:N2
    x11(i)=X1(i);
    x21(i)=X2(i);
end

Y = id.Y;
for i=1:N2
    for j=1:N2
       phi((i-1)*N+j,:)=[X1(i) X2(j) X1(i)*X2(j) 1 X1(i)^2 X2(j)^2];
       y((i-1)*N+j)=Y(j,i);
    end
end

%[X,Y] = meshgrid(-2:0.01:2);  

size(phi);
size(y);
theta=phi\y;
%f = [theta(1) theta(2) theta(3) theta(4) theta(5) theta(6)];
%f = @(x1,x2)(theta(1).*x1 + theta(2).*x2 + theta(3).*x1.*x2 + theta(4) + theta(5).*x1.^2 + theta(6).*x2.^2);
%plot(X1,Y(1,:), 'r', X1,a);shg
%plot(X1,X2,f(x1,x2));shg
%f = (theta(1).*X1 + theta(2).*X2 + theta(3).*X1.*X2 + theta(4) + theta(5).*X1.^2 + theta(6).*X2.^2);

for i=1:N2
    for j=N2:N
       f1(i,j-N2+1)=[theta(1).*X1(i) + theta(2).*X2(j) + theta(3).*X1(i).*X2(j) + theta(4) + theta(5).*X1(i).^2 + theta(6).*X2(j).^2];
       Y21(i,j-N2+1)=Y(i,j);
    end
end
for i=N2:N
    for j=1:N2
       f2(i-N2+1,j)=[theta(1).*X1(i) + theta(2).*X2(j) + theta(3).*X1(i).*X2(j) + theta(4) + theta(5).*X1(i).^2 + theta(6).*X2(j).^2];
       Y22(i-N2+1,j)=Y(i,j);
    end
end
for i=N2:N
    for j=N2:N
       f3(i-N2+1,j-N2+1)=[theta(1).*X1(i) + theta(2).*X2(j) + theta(3).*X1(i).*X2(j) + theta(4) + theta(5).*X1(i).^2 + theta(6).*X2(j).^2];
       Y23(i-N2+1,j-N2+1)=Y(i,j);
    end
end

hold on;
surf(x12,x21,f1,'EdgeColor','b');
surf(x11,x22,f2,'EdgeColor','b');
surf(x12,x22,f3,'EdgeColor','b');
%surf(x12,x21,Y21,'EdgeColor','r'); hold on;
%surf(x11,x22,Y22,'EdgeColor','b');
%surf(x12,x22,Y23,'EdgeColor','g');
shg

%mse
sum1=0;
for i=1:N2
    for j=N2:N
        sum1=sum1 + (Y21(i,j-N2+1)-f1(i,j-N2+1))^2;
    end
end
sum2=0;
for i=N2:N
    for j=1:N2
        sum2=sum2 + (Y22(i-N2+1,j)-f2(i-N2+1,j))^2;
    end
end
sum3=0;
for i=N2:N
    for j=N2:N
        sum3=sum3 + (Y23(i-N2+1,j-N2+1)-f3(i-N2+1,j-N2+1))^2;
    end
end
mse1=sum1/N2/N2;
mse2=sum2/N2/N2;
mse3=sum3/N2/N2;
sum=mse1+mse2+mse3;
mse=sum/3