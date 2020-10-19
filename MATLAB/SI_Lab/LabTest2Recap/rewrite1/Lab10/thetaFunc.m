function [ theta ] = thetaFunc( id, na, nb, theta0, Pinv0 )

N = length(id.u);
u = id.u;
y = id.y;

phi = []; phi1 = []; phi2 = [];

theta = theta0;
Pinv = Pinv0;

thetaM = [];

for i=1:N
    phi = [];
    for j=1:na
        if i>j
            phi = [phi; -y(i-j)];
        else
            phi = [phi; 0];
        end
    end
    for j=1:nb
        if i>j
            phi = [phi; u(i-j)];
        else
            phi = [phi; 0];
        end
    end
    
    
    e(i) = y(i) - (phi' * theta);
    Pinv = Pinv - ((Pinv * phi * phi' * Pinv)/(1 + phi' * Pinv *phi));
    theta = theta + Pinv * phi * e(i);
    thetaM = [thetaM; theta'];
end
theta = thetaM(round(N/10), :);
A = [1 thetaM(1:na)];
B = [0 thetaM(na+1:na+nb)];
model = idpoly(A,B,[],[],[],0,id.Ts);

end

