load('proj_fit_02.mat');
X1 = id.X{1,1};
X2 = id.X{2,1};
N = length(X1);
Y = id.Y;

X1val = val.X{1,1};
X2val = val.X{2,1};
N2=length(X1val);
Yval=val.Y;

phi=ones(N,3);
fid=ones(N,N);
fval=ones(N,N);
y=ones(N*N,1);

for i=1:N
    for j=1:N
       phi((i-1)*N+j,:)=[X1(j) X2(i) 1 ];
       y((i-1)*N+j)=Y(j,i);
    end
end

theta=phi\y;

for i=1:N
    for j=1:N
       fid(i,j)=[theta(1).*X1(i) + theta(2).*X2(j)  + theta(3)];
    end
end
for i=1:N2
    for j=1:N2
       fval(i,j)=[theta(1).*X1val(i) + theta(2).*X2val(j)  + theta(3)];
    end
end

subplot(211);
hold on;
surf(X1,X2,fid,'EdgeColor','b');
surf(X1,X2,Y,'EdgeColor','r');
hold off;
subplot(212);
hold on;
surf(X1val,X2val,fval,'EdgeColor','b');
surf(X1val,X2val,Yval,'EdgeColor','r');
hold off;

%mse
sum=0;
for i=1:N
    for j=1:N
        sum=sum + (Y(i,j)-fid(i,j))^2;
    end
end
mse=sum/N/N;
sum=0;
for i=1:N2
    for j=1:N2
        sum=sum + (Yval(i,j)-fval(i,j))^2;
    end
end
mseval=sum/N2/N2;


