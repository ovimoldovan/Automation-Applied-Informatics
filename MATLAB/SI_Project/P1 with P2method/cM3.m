function [M3] = cM3(M1,M2)

N=length(M1);
n1=length(M2);

for i=1:N
   m=[];
   for j=i:n1
       Mv=M2(j).v;
       n2=length(Mv);
       for k=1:n2
           m=horzcat(m,M1(i)*Mv(k));
       end
   end
   M3(i).v=m;
end

end