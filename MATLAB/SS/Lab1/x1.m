function x = x1(t,x)
if t>=0
    x = -t+2;
elseif t<0
    x = -t-2;
elseif (t<-4) || (t>4)
    x = 0;
end