function [ x ] = getX(u, C, D)
x = [];
N = length(u);
phi = []; phi1 = []; phi2 = [];

nc = length(C) - 1;
nd = length(D) - 1;

theta = [C(2:end), D(2:end)]';

for k=1:N
    for i=1:nc
        if k-i>0 
            phi1(k,i) = -x(k-i);
        else
            phi1(k,i) = 0;
        end
    end
    for i=1:nd
        if k-i>0 
            phi2(k,i) =  u(k-i);
        else
            phi2(k,i) = 0;
        end
    end
    phi = [phi1 phi2];
    
    x(k) = phi(k,:)*theta;
   
end
end

