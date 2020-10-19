function [ u ] = prbs( N,m,a,b )

%X0 = [1, round(rand([1, m-1]))];
X0 = [1, zeros(1,m-1)];

X0 = X0';

switch m
    case 3
        A1 = [1 0 1];
    case 4
        A1 = [1 0 0 1];
    case 5
        A1 = [1 0 0 0 1];
    case 6 
        A1 = [1 0 0 0 0 1];
    case 7
        A1 = [1 0 0 0 0 0 1];
    case 8
        A1 = [1 0 0 0 0 0 0 1];
    case 9
        A1 = [1 0 0 0 0 0 0 0 1];
    case 10
        A1 = [1 0 0 0 0 0 0 0 0 1];
    case 11 
        A1 = [1 0 0 0 0 0 0 0 0 0 1];
    case 12
        A1 = [1 0 0 0 0 0 0 0 0 0 0 1];
end

A = [A1; eye(m-1) zeros(m-1,1)];

x = X0;
for k=1:N
    xnew = mod(A*x,2);
    u(k) = x(m);
    x = xnew;
end

for k=1:N
    u2(k) = a + ((b-a)*u(k));
end

u = u2;

end

