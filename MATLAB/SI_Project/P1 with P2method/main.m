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

m=4;
theta=cphi(X1,X2,m,Y);
yhidp=cyhp(X1,X2,theta,m);
yhvalp=cyhp(X1val,X2val,theta,m);
[mse,mseval] = mserror(Y,Yval,yhidp,yhvalp,N,N2);
    
%subplot(211)
%plot_surf(X1,X2,yhidp,Y);
%subplot(212)
plot_surf(X1val,X2val,yhvalp,Yval);