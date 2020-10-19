load('lab5_1.mat')
%% id
input = id.u;
output = id.y;
mean(input)
mean(output)
input = input - mean(input);
output = output - mean(output);
mean(input)
mean(output)

figure(1)
white_noise = xcorr(input);
plot(white_noise)

ru0 = 0;
%for i=1:length(input)
%    ru0 = ru0 + input(i)^2;
%end

ru0 = sum(input.^2)/length(input);
figure(2)
%M = 10;
%h_tau = cra([input,output], M, 0);
%yhat = conv(h_tau,input);
%yhat = yhat(1:length(input));
%plot(tid,yhat,'r',tid,output)

ryu = ryu_func(length(input),input,output);
h_tau = ryu/ru0;

M = 45;
h_tau = h_tau(1:M);

yhat = conv(h_tau,input);

%plot(ryu)

plot(tid,yhat(1:length(input)),tid,output)

%ru = yhat/h_tau;

mse = sum((yhat(1:length(input))-output).^2)/length(input);


%%  val

figure(3)
input_val = val.u;
output_val = val.y;
yhat2 = conv(h_tau, input_val);
plot(tval, yhat2(1:length(input_val)),'r',tval,output_val);

mseval = sum((yhat2(1:length(input_val))-output_val).^2)/length(input_val);

figure(4)
model = impulseest(id,20);
compare(model,val)

