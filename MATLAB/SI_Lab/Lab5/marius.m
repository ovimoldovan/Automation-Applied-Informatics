close all
plot(id)
figure
plot(val)

%%
M = 37;
plotlevel = 1;

id = detrend(id)
fir = cra(id, M, [], plotlevel)

yhat = conv(fir, id.u);
yhat = yhat(1:length(id.u))

error = id.Y - yhat;
mseid = sum(error.^2)/length(error) 

%%
close all
plot(id.y)
hold on 
plot(yhat)

%%
yhat = conv(fir, val.u);
yhat = yhat(1:length(val.u))

error = val.Y - yhat;
mseval = sum(error.^2)/length(error) 

close all
plot(val.y)
hold on 
plot(yhat)

%%
model = impulseest(id)
compare(model, val)

%%
udt = id.u - mean(id.u)
autoCorr = xcorr(udt);
plot(autoCorr)

%% 
plotlevel = 1;
id = detrend(id)
mseidvect = []
msevalvect = []
for M = 1 : 100
    fir = cra(id, M, [], plotlevel);

    yhatid = conv(fir, id.u);
    yhatid = yhatid(1:length(id.u));

    error = id.Y - yhatid;
    mseid = sum(error.^2)/length(error) ;

    yhat = conv(fir, val.u);
    yhat = yhat(1:length(val.u));

    error = val.Y - yhat;
    mseval = sum(error.^2)/length(error) ;
    
    mseidvect = [mseidvect, mseid];
    msevalvect = [msevalvect, mseval];
end

minM = min(msevalvect)
minMid = find(msevalvect<=minM, 1, 'first')
plot(mseidvect)
hold on
plot(msevalvect)

%%
% M = 50;
% plotlevel = 1;
% 
% id = detrend(id)
% fir = cra(id, M, [], plotlevel)
% res = impulse()
