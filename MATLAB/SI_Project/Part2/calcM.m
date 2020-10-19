function [ M ] = calcM( na,nb,nk,u,y,k)

M=[];

for i=1:na
    if k-i>0
        M = [ M, y(k-i)];
    else
        M = [ M, 0];
    end
end
for i=1:nb
    if k-i-nk+1>0
        M = [M, u(k-i)];
    else
        M = [M, 0];
    end
end


end

