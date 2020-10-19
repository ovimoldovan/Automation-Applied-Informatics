% Monte Carlo algorithm to determine the configuration factor%
%inputs%
H = 1;
W = 2;
x = 0.5;
N = 1000;
ip = sqrt(H^2+x^2);
W = W-x;
ip2 = sqrt(H^2+W^2);

sinBmin = -x/ip ;
sinBmax = W/ip2;
%function%
n = 0;
s = 0;
   R = rand(1,N);
while true
    n = n+1;
    sinB = 1 - 2 * R(n);
    if sinB > sinBmin 
        if sinB < sinBmax
            s = s+1;
        end
    end
    if n==N 
        break;
    end
end
display(s/N);


