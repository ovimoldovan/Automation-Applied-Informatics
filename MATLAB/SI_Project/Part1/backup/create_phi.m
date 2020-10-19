%% create_phi
n=1;
phi = 1;
for i=1:n+1
    for j=1:n+1
        if i~=1 && j~=1
                phi = horzcat(phi, x1^(i-1) * x2(j-1));
        end
    end
end