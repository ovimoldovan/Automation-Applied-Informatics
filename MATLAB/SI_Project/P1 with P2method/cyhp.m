function [yhp] = cyhp(x1,x2,theta,m)

N=length(x1);

for i=1:N
    for j=1:N
        M1=[x1(i) x2(j)];    
        M2(1).v=x1(i);
        M2(2).v=x2(j);
        yh2=horzcat(1,M1);
        for k=1:m-1
            M3=cM3(M1,M2);
            M2=M3;
            M3v=cM3v(M3);
            yh2=horzcat(yh2,M3v);
        end
        ysum=0;
        for k=1:length(yh2)
            ysum=ysum+yh2(k)*theta(k);
        end
       yh(i,j)=ysum;
    end
end
yhp=yh';

end