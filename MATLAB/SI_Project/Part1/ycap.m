function [ fid,fval ] = ycap( X1,X2,X1val,X2val,Y,N,N2,grad )

n=grad;

nv = (n+1)^2 - 2*n + 1;
phi=zeros(N*N,sum([n+2,2:n]));
fid=zeros(N,N);
fval=zeros(N2,N2);
y=zeros(N*N,1);

for i=1:N
    for j=1:N
        reg = [];
        for k=0:n
           for l=0:n
              if k+l<=n
                reg = horzcat(reg, X1(i).^k.*X2(j).^l);
              end
           end
        end
       phi((i-1)*N+j,:)=reg;
       y((i-1)*N+j)=Y(j,i);
    end
end

theta=phi\y;
size(theta);

for i=1:N
    for j=1:N
        reg = [];
        for k=0:n
           for l=0:n
              if k+l<=n
                reg = horzcat(reg, X1(i).^k.*X2(j).^l);
              end
           end
        end
       f1=0;
       for k=1:length(theta)
          f1=f1+reg(k)*theta(k);
       end
       fid(i)=f1;
    end
end

for i=1:N2
    for j=1:N2
        reg = [];
        for k=0:n
           for l=0:n
              if k+l<=n
                reg = horzcat(reg, X1val(i).^k.*X2val(j).^l);
              end
           end
        end
       f2=0;
       for k=1:length(theta)
          f2=f2+reg(k)*theta(k);
       end
       fval(i,j)=f2;
    end
end

% for i=1:N
%     for j=1:N
%         p=1;
%         for k=0:n
%            for l=0:n
%                if (k+l<=n)
%                     fid(i,j) = fid(i,j) + theta(p).*X1(i).^k.*X2(j).^l;
%                     p=p+1;
%                end
%            end
%         end 
%     end
% end
% 
% for i=1:N2
%     for j=1:N2
%         p=1;
%         for k=0:n
%            for l=0:n
%                if (k+l<=n)
%                 fval(i,j) = fval(i,j) + theta(p).*X1val(i).^k.*X2val(j).^l;
%                 p=p+1;
%                end
%            end
%         end 
%     end
% end


