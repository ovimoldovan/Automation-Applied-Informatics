load('lab3_08.mat');
plot(id.X,id.Y)

%n = number of gbf

n = 10;

N = length(id.X);
t = 1:N;

%phi = ones(N,1);
%theta = ones(1,N);

xmin = id.X(1);
xmax = id.X(N);
%the domain 
domain = xmax-xmin;
%distance
distance = domain / (n-1);
b = distance;
c = xmin:distance:xmax;
%phi = zeros(N,n);
for k=1:N
    for j=1:n
        phi(k,j) = exp(-((id.X(k)-c(j))^2)/(b^2));
    end
end
figure(2)
plot(phi)

theta = phi\(id.Y)';
yc = phi * theta;
mse = 0;
for i=1:N
    mse = mse + (id.Y(i)-yc(i))^2;
end
mse = mse/N;

figure(3)
plot(val.X, val.Y, id.X, yc);hold on
%plot(val.X,val.Y)
hold off;

Nval = length(val.X);
phiVal = zeros(Nval,n);
for k=1:Nval
    for j=1:n
        phiVal(k,j) = exp(-((val.X(k)-c(j))^2)/(b^2));
    end
end

figure(4)
%plot(phiVal)

ycVal = phiVal * theta;

plot(id.X, yc, val.X, ycVal)
mse2 = 0;
for i=1:N
    mse2 = mse2 + (val.Y(i)-ycVal(i))^2;
end
mse2 = mse2/N;



