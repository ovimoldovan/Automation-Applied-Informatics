function [X ] = X_computation( N,U,nc,nd,theta )
X0=0;
U0=0;
 for i=1:N
    k1=1;
    k2=1;
    for j=1:(nc+nd)
       if k1<=nc
          ky=i-k1;
          if ky<1
              phi(i,j)=X0;
          else
              phi(i,j)=-X(ky);
          end
       elseif k1>nc
           ku=i-k2;
           if ku<1
             phi(i,j)=U0;
           else
             phi(i,j)=U(ku);
           end
           k2=k2+1;
       end
        k1=k1+1;
    end
    X(i,:)=phi(i,:)*theta;
 end
end

