load('lab5_1.mat');
%plot(id);
Uid=id.u;
Yid=id.y;
inputMean=mean(Uid);
outputMean=mean(Yid);
Uzm=Uid-inputMean;
Yzm=Yid-outputMean;
%plot(tid,Uzm);
Uval=val.u;
Yval=val.y;
plot(tval,Yval);
N=2500;
for t=0:N-1
    aux=0;
    for k=0:(N-1-t)
        aux=aux+Uzm(k+t+1)*Uzm(k+1);
    end
    ru(t+1)=aux*1/(N-t+1);
end
plot(ru);
z(:,1)=Yzm(:,1);
z(:,2)=Uzm(:,1);
h=cra(z,20,0);
y1=conv(h,Uzm);
y1 = y1(1:length(id.u));
plot(tid,y1,tid,Yzm);
plot(Yzm);
figure()
y2=conv(h,Uval);
y2 = y2(1:length(val.u));
plot(y2);hold on
plot(Yval);
figure()
model = impulseest(id, 40);
compare(model, val);