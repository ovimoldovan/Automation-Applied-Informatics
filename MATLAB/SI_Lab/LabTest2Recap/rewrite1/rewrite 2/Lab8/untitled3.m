clear all; close all;
load('lab8_8.mat');
u = id.u;
y = id.y;
N = length(u);
f = 1; b = 1;
theta = [f,b]';

lmax = 500;
alpha = 0.01;
delta = 0.001;
l = 1;
e(1) = y(1);
dV = 0; H = 0;
% do
for k=2:N
    e(k) = y(k) + y(k-1)*f - b * u(k-1) - f * e(k-1);
    df = y(k-1) - e(k-1);
    db = -u(k-1);
    de = [df; db];
    dV = dV + 2/N * e(k) * de;
    H = H + 2/N * de * de';
end
thetaNew = theta - alpha * inv(H) * dV;
l = l+1;
f = thetaNew(1); b = thetaNew(2);
while l<lmax && norm(theta-thetaNew) > delta
    dV = 0; H = 0;
    theta = [f;b];
    for k=2:N
    e(k) = y(k) + y(k-1)*f - b * u(k-1) - f * e(k-1);
    df = y(k-1) - e(k-1);
    db = -u(k-1);
    de = [df; db];
    dV = dV + 2/N * e(k) * de;
    H = H + 2/N * de * de';
end

thetaNew = theta - alpha * inv(H) * dV;
l = l+1;
f = thetaNew(1); b = thetaNew(2);

end

model = idpoly(1, [0, b], 1, 1, [1, f], 0, id.Ts);
compare(model,val)

