%% loading the datas

load('proj_fit_02.mat');
X1 = id.X{1,1};
X2 = id.X{2,1};
Y = id.Y;
N = length(X1);
X1val = val.X{1,1};
X2val = val.X{2,1};
Yval= val.Y;
N2=length(X1val);

for m=1:20
    m
    theta=cphi(X1,X2,m,Y);
     yhidp=cyhp(X1,X2,theta,m);
     yhvalp=cyhp(X1val,X2val,theta,m);
    [mse,mseval] = mserror(Y,Yval,yhidp,yhvalp,N,N2);
     mseid(m)=mse;
     msev(m)=mseval;
end
subplot(211);
plot([1:20],mseid,'r'); legend('identification');
xlabel('Degree of the polynomial');ylabel('Mean Squarred Error');
subplot(212)
plot([1:20],msev,'b');legend('validation');
xlabel('Degree of the polynomial');ylabel('Mean Squarred Error');