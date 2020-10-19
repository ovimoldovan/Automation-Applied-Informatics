function [ fid, fval ] = third_order( X1,X2,X1val,X2val,Y,N,N2 )

fid=ones(N,N);
fval=ones(N,N);
phi=ones(N*N,11);
y=ones(N*N,1);

for i=1:N
    for j=1:N
       phi((i-1)*N+j,:)=[X1(j), X2(i), X1(j)*X2(i), 1, X1(j)^2, X2(i)^2, X1(j)^3, X2(i)^3, X1(j)^2*X2(i), X1(j)*X2(i)^2, X1(j)^2*X2(i)^2];
       y((i-1)*N+j)=Y(j,i);
    end
end

theta=phi\y;
for i=1:N
    for j=1:N
       fid(i,j)=[theta(1).*X1(i) + theta(2).*X2(j) + theta(3).*X1(i).*X2(j) + theta(4) + theta(5).*X1(i).^2 + theta(6).*X2(j).^2 + theta(7)*X1(i).^3 + theta(8)*X2(j).^3 + theta(9)*X1(i).^2*X2(j) + theta(10)*X1(i)*X2(j).^2+ theta(11)*X1(i).^2*X2(j)^2];
    end
end

for i=1:N2
    for j=1:N2
       fval(i,j)=[theta(1).*X1val(i) + theta(2).*X2val(j) + theta(3).*X1val(i).*X2val(j) + theta(4) + theta(5).*X1val(i).^2 + theta(6).*X2val(j).^2 + theta(7)*X1val(i).^3 + theta(8)*X2val(j).^3 + theta(9)*X1val(i).^2*X2val(j) + theta(10)*X1val(i)*X2val(j).^2+ theta(11)*X1val(i).^2*X2val(j)^2];
    end
end

end

