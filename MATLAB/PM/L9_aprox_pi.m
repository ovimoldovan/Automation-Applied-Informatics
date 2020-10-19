n = 100000;
S1 = rand(1,n);
S2 = rand(1,n);
X = S1 - 0.5;
Y = S2 - 0.5;



r = X.^2 + Y.^2;
pai = 0;
hold all;
for i=1:n
    if r(i) <=0.25;
        plot(S1(i),S2(i), 'r.');
        pai = pai+1;
    end
end


pai = pai/(0.25*n);
display(pai);