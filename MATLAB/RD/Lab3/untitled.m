%%
%load("failure_times_1.mat (1)");

%%
data_s = sort(ft);

n0 = 20;
rc = 6;
rt = 12;
tt = 10000;
tc = data_s(rc);


SE = 0;
for i=1:n0
    SE = SE + data_s(i);
end;


SC = 0;
for i=1:rc
    SC = SC + data_s(i);
end
SC = SC +(n0-rc)*tc;


ST = 0;
for i=1:rt
    ST = ST + data_s(i);
end
ST = ST +(n0-rt)*tt;

m = 5;
w = (data_s(end)-data_s(1))/(m-1);

u1 = data_s(1)-w/2;
u2 = u1+w;
u3 = u2+w;
u4 = u3+w;
u5 = u4+w;
u6 = u5+w;
u7 = u6+w;

uc1 = (u1+u2)/2;
uc2 = (u2+u3)/2;
uc3 = (u3+u4)/2;
uc4 = (u4+u5)/2;
uc5 = (u5+u6)/2;
uc6 = (u6+u7)/2;


dri1 = length(find(data_s<u2));
dri2 = length(find(data_s<u3));
dri3 = length(find(data_s<u4));
dri4 = length(find(data_s<u5));
dri5 = length(find(data_s<u6));
dri6 = length(find(data_s<u7));

sumadri = dri1+dri2+dri3+dri4+dri5+dri6;

MTBFepuizat = mean(data_s);
suma = 0;
for i=1:n0
    suma = suma + (data_s(i)-MTBFepuizat)^2;
end
standarddeviation = sqrt(suma / (n0-1));

%% incercari cenzurate
MTBFc = SC/rc %valoarea punctuala a MTBF
lambdac = 1/MTBFc;

%% incercari trunchiate
MTBFt = ST/(rt+1);
lambdat = 1/MTBFt;

%%
n1 = n0 - dri1;
n2 = n0 - dri2;
n3 = n0 - dri3;
n4 = n0 - dri4;
n5 = n0 - dri5;
n6 = n0 - dri6;