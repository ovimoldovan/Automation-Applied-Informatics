function [ y ] = ValFunction( theta, u,nc,nd )
    
y = [];

N = length(u);

phi1=[];phi2=[];phi=[];

for i=1:N
    for j=1:nc
        if i-1>0 && i-j>0 
            phi1(i,j) = -y(i-j);
        else
            phi1(i,j) = 0;
        end
        for j=1:nd
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

