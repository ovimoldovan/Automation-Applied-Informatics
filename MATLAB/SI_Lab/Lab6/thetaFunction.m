function [ theta,phi ] = thetaFunction( u,y,na,nb )

N = length(u);

%phi = zeros(N,na+nb);

%u = [2 4 3 1 5]
%y = [7 8 2 9 6]
%N = 5

for i=1:N
    for j=1:na
        if i-j>0 
            phi1(i,j) = -y(i-j);
        else
            phi1(i,j) = 0;
        end
        for j=1:nb
            if i-j>0
                phi2(i,j) = u(i-j);
            else
                phi2(i,j) = 0;
            end
        end
    end
end

phi = horzcat(phi1,phi2);

theta = phi\y;

end

