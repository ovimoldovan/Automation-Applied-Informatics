load('proj_fit_02.mat');
Y=id.Y;
x1=id.X{1,1};
x2=id.X{2,1};
N=id.dims(1,1);
m=2;
k=1;
phi=ones(N^2,1);
for i=1:N
    for j=1:N
        k2=2;
        p1=1;
        m1=m;
        c=2;
        for k1=1:m
         phi(k,k2:k2+1)=[x1(i)^k1 x2(j)^k1];
         k2=k2+2;
         for p2=1:(m1-1)
             phi(k,m*2+c)=x1(i)^p1*x2(j)^p2;
             c=c+1;
         end
         p1=p1+1;
         m1=m1-1;
        end
        k=k+1;
    end
end
Y1=reshape(Y,N*N,1);
theta=phi\Y1;
y=phi*theta;
y1=reshape(y,N,N);
surf(x1,x2,Y);hold on;
hSurface=surf(x1,x2,y1);
set(hSurface,'FaceColor',[0 0 1],'FaceAlpha',1);
MSE=0;
for i=1:N*N
    MSE=((Y1(i)-y(i))^2)+MSE;
end
MSE=MSE/(N*N);
Yval=val.Y;
x1val=val.X{1,1};
x2val=val.X{2,1};
Nval=val.dims(1,1);
k=1;
phival=ones(Nval^2,1);
for i=1:Nval
    for j=1:Nval
        k2=2;
        p1=1;
        m1=m;
        c=2;
        for k1=1:m
         phival(k,k2:k2+1)=[x1val(i)^k1 x2val(j)^k1];
         k2=k2+2;
         for p2=1:(m1-1)
             phival(k,m*2+c)=x1val(i)^p1*x2val(j)^p2;
             c=c+1;
         end
         p1=p1+1;
         m1=m1-1;
        end
        k=k+1;
    end
end
Y1val=reshape(Yval,Nval*Nval,1);
yval=phival*theta;
y1val=reshape(yval,Nval,Nval);
figure();
surf(x1val,x2val,Yval);hold on;
hSurface=surf(x1val,x2val,y1val);
set(hSurface,'FaceColor',[0 0 1],'FaceAlpha',1);
MSEval=0;
for i=1:Nval
    MSEval=((Y1val(i)-yval(i))^2)+MSEval;
end
MSEval=MSEval/Nval;