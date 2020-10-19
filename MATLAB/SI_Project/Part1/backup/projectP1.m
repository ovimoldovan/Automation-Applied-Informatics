%% Getting the data
load('proj_fit_02.mat');
X1 = id.X{1,1};
X2 = id.X{2,1};
Y = id.Y;
N = length(X1);
X1val = val.X{1,1};
X2val = val.X{2,1};
Yval= val.Y;
N2=length(X1val);


%% CALCULATING Y cap

[fid,fval] = first_order(X1,X2,X1val,X2val,Y,N,N2,n);
%[fid2,fval2] = second_order(X1,X2,X1val,X2val,Y,N,N2);
%[fid3,fval3] = third_order(X1,X2,X1val,X2val,Y,N,N2);



%% The plots

%First order
subplot(231)
plot_surf(X1,X2,fid1,Y);
subplot(234)
plot_surf(X1val,X2val,fval1,Yval);

%Second order
subplot(232)
plot_surf(X1,X2,fid2,Y);
subplot(235)
plot_surf(X1val,X2val,fval2,Yval);

%Third order
subplot(233)
plot_surf(X1,X2,fid3,Y);
subplot(236)
plot_surf(X1val,X2val,fval3,Yval);

%% The errors

[mse1,mseval1] = mse(Y,Yval,fid1,fval1,N,N2);
[mse2,mseval2] = mse(Y,Yval,fid2,fval2,N,N2);
[mse3,mseval3] = mse(Y,Yval,fid3,fval3,N,N2);