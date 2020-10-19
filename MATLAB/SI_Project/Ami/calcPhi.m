function [ phi ] = calcPhi( na,nb,nk,m,u,y )

N = length(u);

for k=1:N
    M1 = calcM(na,nb,nk,u,y,k);
    for i=1:length(M1)
        M2(i).v = M1(i);
    end
    M = [];
    phi2 = [1, M1];
    for i=1:m-1
        M3 = calcM3(M1,M2);
        M2 = M3;
        for j=1:length(M3)
            phi2 = [phi2, M3(j).v];
        end
    end
    phi(k,:) = phi2;
end

end

