function [summa]=fn(n,M,x)
   summa=0;
   for k=1:M
       summa=summa+x(k)*x(k-n);
   end
end