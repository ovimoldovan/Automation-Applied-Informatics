function [ x ] = getX( id, C, D )
phi1=[];phi2=[];phi = [];
nc = length(C) - 1;
nd = length(D) - 1;

N = length(id.u);
u = id.u;

theta = [C(2:end), D(2:end)]';

for i=1:N
    for j=1:nc
        if i-j>0 
            phi1(i,j) = -x(i-j);
        else
            phi1(i,j) = 0;
        end
    end
    for j=1:nd
        if i-j>0 
            phi2(i,j) = u(i-j);
        else
            phi2(i,j) = 0;
        end
    end
    size(phi)
    phi = [phi1 phi2];
    
    x(i) = phi(i,:) * theta;
end
end

