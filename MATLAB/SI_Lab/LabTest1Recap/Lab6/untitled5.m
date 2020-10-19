clear all;
close all;
load('lab6_1.mat');

u = id.u; y = id.y;

N = length(u);

na = 4;
nb = 4;

for i=1:N
    for j=1:na
        if i-j>0
            phi1(i,j) = -y(i-j);
        else
            phi1(i,j) = 0;
        end
    end
    for j=1:nb
        if i-j>0
            phi2(i,j) = u(i-j);
        else
            phi2(i,j) = 0;
        end
    end
end

phi = horzcat(phi1,phi2);

theta = phi\y;

%Val

uval = val.u; yval = val.y;
N = length(uval)
yhat = [];
for i=1:N
    for j=1:na
        if i-j>0
            phi1(i,j) = -yhat(i-j);
        else
            phi1(i,j) = 0;
        end
    end
    for j=1:nb
        if i-j>0
            phi2(i,j) = uval(i-j);
        else
            phi2(i,j) = 0;
        end
    end
    phi3 = horzcat(phi1,phi2);
    yhat(i,:) = phi3(i,:) * theta;
end

plot(yval);hold on; plot(yhat)
