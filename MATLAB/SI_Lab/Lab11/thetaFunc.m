function [ theta ] = thetaFunc( id, na, nb, theta0, Pinv0 )

N = length(id.u);

u = id.u;
y = id.y;
theta = theta0;
Pinv = Pinv0;

thetaM = [];

error = [];

for k=1:N
    phi = [];
    for i=1:na
        if k-i>0
            phi = [phi;-y(k-i)];
        else
            phi = [phi;0];
        end
    end
    for i=1:nb
        if k-i>0
            phi = [phi; u(k-i)];
        else
            phi = [phi;0];
        end
    end
    Pinv = Pinv - ((Pinv*phi*phi'*Pinv)/(1 + phi'*Pinv*phi));
    error(k) = y(k) - (phi' * theta);
     
    theta = theta + Pinv*phi * error(k);
    thetaM = [thetaM; theta'];
end

theta = thetaM(round(N/10), :);

end

