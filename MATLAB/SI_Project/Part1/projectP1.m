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
string = 'Enter the grade of the polynomial ';

%n = input(string);

for n=1:50
    [fid,fval] = ycap(X1,X2,X1val,X2val,Y,N,N2,n);


%% The plots

%First order
%subplot(211)
%plot_surf(X1,X2,fid,Y);
%subplot(212)
%plot_surf(X1val,X2val,fval,Yval);

%% The errors

[mse,mseval] = mserror(Y,Yval,fid,fval,N,N2);
%[n;mse;mseval]
mseid(n)=mse;
msev(n)=mseval;
end
subplot(211);
plot([1:50],mseid,'r'); legend('identification');
subplot(212)
plot([1:50],msev,'b');legend('validation');