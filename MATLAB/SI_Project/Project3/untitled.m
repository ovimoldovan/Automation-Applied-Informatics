clear all; close all;

load('iddata-09.mat');


uid = id.u;
yid = id.y;


N = length(uid);
na = 2;
nb = 1;

phi = zeros(N,10);


for i=1:N
    if i==1
       phi(i,:) = [0,0,0,0,0,0,0,0,0,1]; 
    elseif i==2
        phi(i,:) = [yid(1)^2, 0, uid(1)^2, 0, yid(1)*uid(1), 0, yid(1), 0, uid(1), 1];
    else
        phi(i,:) = [yid(i-1)^2, yid(i-2)^2, uid(i-1)^2, yid(i-1)*yid(i-2), yid(i-1)*uid(i-1), yid(i-2)*uid(i-1), yid(i-1), yid(i-2), uid(i-1), 1];
    end
        
end


theta = phi\yid;

u = val.u;
y = val.y;
t = 0:id.Ts:id.Ts*length(u)-id.Ts;

f=zeros(N,1);

for i=1:N
    if i==1
       f(i) =f(i)+theta(10);
    elseif i==2
        f(i) =f(i)+theta(1)*y(1)^2+theta(3) * u(1)^2 + theta(5)*y(1)*u(1) + theta(7) * y(1) + theta(9) * u(1) +theta(10);
    else
        f(i) = f(i) + theta(1)* y(i-1)^2 + theta(2) * y(i-2)^2 + theta(3) *  u(i-1)^2 + theta(4) *  y(i-1)*y(i-2) + theta(5)* y(i-1)*u(i-1) + theta(6) * y(i-2)*u(i-1) + theta(7)* y(i-1) + theta(8)* y(i-2) + theta(9)* u(i-1) + theta(10) *1;
    end
        
end

subplot(211);
plot(t,y,'b',t,f,'r'); title('prediction');


fs=zeros(N,1);

for i=1:N
    if i==1
       fs(i) =fs(i)+theta(10);
    elseif i==2
        fs(i) =fs(i)+theta(1)*fs(1)^2+theta(3) * u(1)^2 + theta(5)*fs(1)*u(1) + theta(7) * fs(1) + theta(9) * u(1) +theta(10);
    else
        fs(i) = fs(i) + theta(1)* fs(i-1)^2 + theta(2) * fs(i-2)^2 + theta(3) *  u(i-1)^2 + theta(4) *  fs(i-1)*fs(i-2) + theta(5)* fs(i-1)*u(i-1) + theta(6) * fs(i-2)*u(i-1) + theta(7)* fs(i-1) + theta(8)* fs(i-2) + theta(9)* u(i-1) + theta(10) *1;
    end
        
end

subplot(212);
plot(t,y,'b',t,fs,'r'); title('simulation');