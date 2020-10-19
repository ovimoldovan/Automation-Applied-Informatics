function [ theta ] = theta_computation( id,na,nb,theta0,Pinv0,procent )
N=length(id.u);
theta=theta0;
Pinv=Pinv0;
U=id.u;
Y=id.y;
U0=0;
Y0=0;
thetaMat=[];
for i=1:N
    k1=1;
    k2=1;
    phi=[];
    for j=1:(na+nb)
       if k1<=na
          ky=i-k1;
          if ky<1
              phi=[phi; Y0];
          else
              phi=[phi; -Y(ky)];
          end
       elseif k1>na
           ku=i-k2;
           if ku<1
             phi=[phi; U0];
           else
             phi=[phi; U(ku)];
           end
           k2=k2+1;
       end
        k1=k1+1;
    end
   error=Y(i)-(phi'*theta);
   Pinv=Pinv-((Pinv*phi*phi'*Pinv)/(1+(phi'*Pinv*phi)));
   theta= theta+Pinv*phi*error;
   thetaMat=[thetaMat; theta'];
end
if procent==100
 theta=thetaMat(N,:);
else
 n=round(N/10);
 theta=thetaMat(n,:);
end
end

