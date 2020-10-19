clear all;
close all;

load('lab5_1.mat')

id = detrend(id)

u = id.u;
y = id.y;

white_noise = xcorr(u);
plot(white_noise);

N = length(u);

ru0 = sum(u.^2)/N;

for t=0:N-1
    sum = 0;
    for k=1:N-t
        sum = sum + y(k+t)*u(k);
    end
    ryu(t+1) = sum * 1/(N-t);
end


h = ryu/ru0;

m = 40;

h = h(1:m);

yhat = conv(h,u);

yhat = yhat(1:length(u));

figure(2)

plot(tid,y,tid,yhat)

fir = cra(id,m,0);
yhat2 = conv(fir,u);
yhat2 = yhat2(1:length(u));

figure(3)

plot(tid,y,tid,yhat2)

