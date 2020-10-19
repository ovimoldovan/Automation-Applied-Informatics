clear all;
close all;
load('iddata-05.mat');

uid = id.u;
yid = id.y;
tid = 0:id.Ts:id.Ts*length(uid)-id.Ts;

na = 2;
nb = 2;
m = 2;
nk = 1;

phi = calcPhi(na,nb,nk,m,uid,yid);
theta = phi\yid;

yCidP = calcP(na,nb,nk,m,uid,yid,theta);
yCidS = calcS(na,nb,nk,m,uid,theta);

subplot(211);
plot(tid,yid,tid,yCidP);
subplot(212);
plot(tid,yid,tid,yCidS);

mseidS = sum((yCidS-yid).^2)/length(uid)
mseidP = sum((yCidP-yid).^2)/length(uid)

% VALIDATION
figure(2)

uval = val.u;
yval = val.y;
tval = 0:val.Ts:val.Ts*length(uval)-val.Ts;

yCvalP = calcP(na,nb,nk,m,uval,yval,theta);
yCvalS = calcS(na,nb,nk,m,uval,theta);

subplot(211);
plot(tval,yval,tval,yCvalP);legend('Original output', 'Predicted output')
xlabel('Time');ylabel('Output')
subplot(212);
plot(tval,yval,tval,yCvalS);legend('Original output', 'Simulated output')
xlabel('Time');ylabel('Output')

msevalS = sum((yCvalS-yval).^2)/length(uval)
msevalP = sum((yCvalP-yval).^2)/length(uval)