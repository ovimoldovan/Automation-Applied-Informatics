function [ e1, e2 ] = mserror( Y,Yval,fid,fval,N,N2 )

N = length(fid);N2 = length(fval);
sum=0;
for i=1:N
    for j=1:N
        sum=sum + (Y(i,j)-fid(i,j))^2;
    end
end
e1=sum/N/N;
sum=0;
for i=1:N2
    for j=1:N2
        sum=sum + (Yval(i,j)-fval(i,j))^2;
    end
end
e2=sum/N2/N2;
end

