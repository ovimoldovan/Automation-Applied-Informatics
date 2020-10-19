function [ ryu ] = ryu_func( N,input,output )
for t=0:N-1
    sum = 0;
    for k=1:N-t
        sum = sum + output(k+t) * input(k);
    end
    ryu(t+1) = sum / (N - t);
end

end

