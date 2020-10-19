clear all;
close all;
load('iddata-09.mat');

uid = id.u;
yid = id.y;
tid = 0:id.Ts:id.Ts*length(uid)-id.Ts;

%na = 2;
%nb = 2;
%m = 2;
nk = 1;

p=1;

for na=1:5
    for m=1:5
        nb=na
        m

phi = calcPhi(na,nb,nk,m,uid,yid);
theta = phi\yid;

yCidP = calcP(na,nb,nk,m,uid,yid,theta);
yCidS = calcS(na,nb,nk,m,uid,theta);

%subplot(211);
%plot(tid,yid,tid,yCidP);
%subplot(212);
%plot(tid,yid,tid,yCidS);

mseidS(p)= sum((yCidS-yid).^2)/length(uid);
mseidP(p) = sum((yCidP-yid).^2)/length(uid);

% VALIDATION
%figure(2)

uval = val.u;
yval = val.y;
tval = 0:val.Ts:val.Ts*length(uval)-val.Ts;

yCvalP = calcP(na,nb,nk,m,uval,yval,theta);
yCvalS = calcS(na,nb,nk,m,uval,theta);

%subplot(211);
%plot(tval,yval,tval,yCvalP);
%subplot(212);
%plot(tval,yval,tval,yCvalS);

msevalS(p) = sum((yCvalS-yval).^2)/length(uval);
msevalP(p) = sum((yCvalP-yval).^2)/length(uval);
p=p+1;
    end
end
figure(3);
subplot(211);
plot(1:50,mseidS);
subplot(212);
plot(1:50,msevalS);