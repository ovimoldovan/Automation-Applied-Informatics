function [ e1, e2 ] = mserror( Y,Yval,fid,fval,N,N2 )
summse=0;
for i=1:N
    for j=1:N
        summse=summse + (Y(i,j)-fid(i,j))^2;
    end
end
e1=summse/N/N;
summse=0;
for i=1:N2
    for j=1:N2
        summse=summse + (Yval(i,j)-fval(i,j))^2;
    end
end
e2=summse/N2/N2;

end