function [ u2 ] = prbs( N,m,a,b )

A1 = [1 zeros(1,m-2) 1];
x = [1 zeros(1,m-1)];
x = x';
A = [A1; eye(m-1) zeros(m-1,1)];

for k=1:N
    xnew = mod(A*x,2);
    u(k) = x(m);
    x = xnew;
end

for k=1:N
    u2(k) = a + ((b-a)*u(k));
end



end

