clear all;close all;
load('lab8_3.mat');
eps(1) = 0;
%eps = zeros(150);
uid = id.u;
yid = id.y;
eps(1) = yid(1);
Ts = id.Ts;
f = 1;
b = 1;
N = length(uid);

theta = [f;b];

l = 1;

alpha = 0.01;

lmax = 500;

delta = 0.001;

dV = 0;
H = 0;


for i=2:N
    eps(i) = -f*eps(i-1) + yid(i) - b * uid(i-1) + f*yid(i-1);
    epsF(i) = -eps(i-1) + yid(i-1);
    epsB(i) = -uid(i-1);
    theta2 = [epsF(i),epsB(i)]';
    dV = dV + 2/N * eps(i)* theta2;
    H = H + 2/N * (theta2*theta2');
end

thetaNew = theta - alpha*inv(H)*dV;
l=l+1;


while l<lmax && norm(thetaNew-theta) > delta;
    theta=thetaNew;
    dV = 0;
    H = 0;
    
    for i=2:N
        eps(i) = -f*eps(i-1) + yid(i) - b * uid(i-1) + f*yid(i-1);
        epsF(i) = -eps(i-1) + yid(i-1);
        epsB(i) = -uid(i-1);
        
        theta2 = [epsF(i);epsB(i)];
        dV = dV + 2/N * eps(i) * theta2;
        H = H + 2/N * (theta2*theta2');
    end
    thetaNew = theta - alpha * inv(H)*dV;
    l=l+1;
    f = thetaNew(1);b=thetaNew(2);
end


model = idpoly(1,[0, thetaNew(2)], 1, 1, [1, thetaNew(1)], 0, Ts);
compare(model,val)