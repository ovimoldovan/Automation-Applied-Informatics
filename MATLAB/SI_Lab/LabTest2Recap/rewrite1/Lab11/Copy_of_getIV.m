function [ model ] = getIV2( id, na, nb, x )

u = id.u; y = id.y;
N = length(u);

u = [zeros(1, na) u'];
y = [zeros(1, nb) y'];
x = [zeros(1, na) x];

phit = zeros(na+nb);
yt = zeros(na+nb,1);

for k=1:N
    Z = [-x((k+na-1):-1:k) u((k+nb-1):-1:k)]';
    phi = [-y((k+na-1):-1:k) u((k+nb-1):-1:k)]';
    phit = phit + 1/N * (Z * phi');
    yt = yt + 1/N * (Z * y(k));
end
theta = phit\yt;
A = [1 theta(1:na)'];
B = [0 theta(na+1:nb)'];
model = idpoly(A,B,1,1,1,0,id.Ts);
end

