function [theta] = cphi(x1,x2,m,Y)

N=length(x1);
phi=zeros(N*N,sum([m+2,2:m]));
y=zeros(N*N,1);
for i=1:N
    for j=1:N
        M1=[x1(i) x2(j)];    
        M2(1).v=x1(i);
        M2(2).v=x2(j);
        phi2=horzcat(1,M1);
        for k=1:m-1
            M3=cM3(M1,M2);
            M2=M3;
            M3v=cM3v(M3);
            phi2=horzcat(phi2,M3v);
       end
       phi((i-1)*N+j,:)=phi2;
       y((i-1)*N+j)=Y(j,i);
    end
end
theta=phi\y;
end