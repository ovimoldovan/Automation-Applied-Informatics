close all;
clear all;
load('lab5_2.mat');

id = detrend(id);

u = id.u; y = id.y;

white_noise= xcorr(u);
plot(white_noise);

N = length(u);

ru0 = sum(u.^2)/N;

for t=0:N-1
    sum = 0;
        for k=1:N-t
            sum = sum + (y(k+t) * u(k));
        end
    ryu(t+1) = sum / (N-t);
end

M = 30;

h = ryu/ru0;
h = h(1:M);

uval = val.u; yval = val.y;

yhat = conv(h,uval);

yhat = yhat(1:length(uval));

figure(2)
plot(yval);hold on;plot(yhat)
