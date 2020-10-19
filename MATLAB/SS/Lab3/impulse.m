%% implus ex 1
n = -1:0.1:6;
delta = @(n)(1.*(n==0) + 0.*(n~=0));
stem(n, delta(n))