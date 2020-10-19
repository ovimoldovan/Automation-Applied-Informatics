function [ out ] = my_stat( x,y )
i=1;
a=0;
if(isscalar(x))
    for i = 1:10
        out = a + (x^i) * y + y/x;
    end
else
    x = [x y];
    out = sort(x);
end


end

