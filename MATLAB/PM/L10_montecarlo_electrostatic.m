%fixed random walk%
N = 100;
%s.tlx = 0;
%s.tly = 0;
%s.trx = 3;
%s.try = 3;
sum = 0;
p = rand(1,N);
%threshold
%p(p>0.5) = 1;
%p(p<=0.5) = 0;

nodes = [9,10,11,12];
for n=1:N
    suma = 0;
    j.x = 1;
    j.y = 1;
    done = 0;
        while done==0
           if 0 < p(n) < 0.25
               j.x = j.x + 1;
           end
           if 0.25 < p(n) < 0.5
               j.x = j.x - 1;
           end
           if 0.5 < p(n) < 0.75
               j.y = j.y + 1;
           end
           if 0.75 < p(n) < 1
               j.y = j.y - 1;
           end
           
           if (j.x == 0) || (j.x == 3) || (j.y == 0) || (j.y == 3)
              done = 1; 
           end
           suma = suma + 1;
         
        end
        sum = sum+suma;
end
display(sum/N);