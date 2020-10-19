function [ y ] = ValFunction( theta, u,na,nb )
    
y = []

N = length(u)

for i=1:N
    for j=1:na
        if i-1>0 && i-j>0 
            phi1(i,j) = -y(i-j);
        else
            phi1(i,j) = 0;
        end
        for j=1:nb
            if i-1>0 && i-j>0
                phi2(i,j) = u(i-j);
            else
                phi2(i,j) = 0;
            end
        end
    end
    
    phi = horzcat(phi1,phi2);
    y(i) = phi(i,:)*theta;
end



end

