clear all;
I2=[5,2,2];
U2=[18,24,24];
U1 = 220;

% a1

P2 = 186;

P = [10, 20, 30, 50, 70, 100, 200, 300, 500, 700, 1000] ;
R = [0.78, 0.81, 0.83, 0.85, 0.87, 0.88, 0.92, 0.93, 0.94, 0.945, 0.95];

randament = interp1(P,R,186);
%plot(P,R);

P_J = [10, 20, 30, 50, 100, 200, 300, 500, 1000];
J = [4, 3.8, 3.6, 3.2, 2.4, 1.40, 1.25, 1, 0.9];
Pg = P2/2*(1+1/randament);
j = interp1(P_J, J, 196);

Sfe = 1.3 * sqrt(Pg*(1+randament)/(j*randament)) ;
%am ales eu intre 1.1 si 1.5 pe 1.3

l = sqrt(Sfe);
lstar=5;
b = Sfe/lstar;
bstar = 1.20 * b;
Ntole = b*10/0.35;
Sfestar = lstar * bstar;
lmed = 4*lstar + 2*bstar;
lmed = lmed/100;
for i = 1:3
    Scu2(i) = I2(i)/j;
end

for i=1:3
    d2(i) = sqrt(4*Scu2(i)/pi);
end

I1 = Pg/U1;
Scu1 = I1/j;
d1 = sqrt(4*Scu1/pi);

d1star=0.9;d2star = [2 1.4 1.4];

%electromotive force
B=1.1;
f = 50;
e = 4.44 * f * B * (0.9 * 20) * 1e-4;

w1 = U1/e;

for i=1:3
    w2(i) = U2(i)/e;
end

ro = 0.0172;

R1 = w1 * ro * lmed/Scu1;

for i=1:3
    R2(i) = w2(i) * ro * lmed/Scu2(i);
end

for i=1:3
    R2star(i) = R2(i) + R1 * (w2(i)/w1)^2;
end

for i=1:3
    Rs(i) = U2(i)/I2(i);
end

for i=1:3
    e2(i) = w2(i)/w1*U1;
    %e2(i) = U2(i)
end



for i=1:3
    U2i(i)=e2(i)-(R2star(i)*I2(i))
end


w2star(1) = w2(1) + R2star(1) + I2(1)/e;
w2star(2) = w2(2) + R2star(2) + I2(2)/e;
w2star(3) = w2star(2);


for i=1:3
    e2star(i) = w2star(i) * e;
end
P2 = 0;
for i=1:3
    P2 = P2 + (U2(i) * I2(i));
end

P = P2/randament;

N0 = w1/U1;
for i=1:3
    N02(i) = w2(i)/U2i(i);
end

Uinv2(1) = sqrt(2) * e2star(1);
Uinv2(2) = 2*sqrt(2) * e2star(2);

Uinv2star(1) = 1.5 * sqrt(2) * U2(1);
Uinv2star(2) = 1.5 * 2 * sqrt(2) * U2(2);

for i=1:3
    I2directstar(i) = 0.7*I2(i);
end

for i=1:3
    I2star(i) = 1.5*0.7*I2(i);
end

rd1 = 0.12; rd2 = 0.4;
for i=1:3
    ID2(i) = (sqrt(2)*U2(i))/(R2star(i) +rd2)
end

U01 = sqrt(2) * U2(1)
U02 = sqrt(2) * U2(2)

I01 = 1/sqrt(2) * 5
I02 = 1/sqrt(2) * 2

Cf1 = 3.75e-3;
Cf2 = 1.4e-3;

for i = 1: 3
    dt(i) = (R2star(i) * 2 * rd1) * Cf2
end
for i=1:3
Ipstar(i) = 2*U2(i)^2 * Cf2/(R2star(i) + 2*rd2)
end
Udirect(1) = e2star(1) * 0.9 - 1.5
for i=2:3
    Udirect(i) = e2star(i) * 0.9 - 0.75
end

q = 67/8;

Rrt1 = R2star(1)+2*rd1
Rrt2 = R2star(2)+rd2
Rrt3 = R2star(3) + rd2

Cf1_stelat = ((1600*q*(Rrt1+Rs(1)))/(Rrt1*Rs(1)))*10^(-6)   %[F]
Cf2_stelat = ((1600*q*(Rrt2+Rs(2)))/(Rrt2*Rs(2)))*10^(-6)
Cf3_stelat = ((1600*q*(Rrt3+Rs(3)))/(Rrt3*Rs(3)))*10^(-6)

Rr1 = Rrt1
R01 = Rs(1)
C01 = Cf1_stelat
E01 = 1.41*e2star(i)-1.5
wC01R01 = 314*C01*R01
kr1 = Rr1/R01

Rr2 = Rrt2
R02 = Rs(2)
C02 = Cf2_stelat
E02 = 1.41*e2star(2)-0.75
wC02R02 = 314*C02*R02
kr2 = Rr2/R02

Rr3 = Rrt3
R03 = Rs(3)
C03 = Cf3_stelat
E03 = 1.41*e2star(3)-0.75
wC02R02 = 314*C02*R02
kr3 = Rr3/R03


ku1 = 0.76     
ku2 = 0.42

U01 = ku1*E01
U02 = ku2*E02
U03 = ku2*E03

Rs1 = R01
rsv1 = Rrt1
fprintf('\nrsv1/Rs1=%6.4f\nb.)\n',rsv1/Rs1);
Rs2 = R02
rsv2 = Rrt2
fprintf('\nrsv2/Rs2=%6.4f\n',rsv2/Rs2);
wC1R1 = 7   
wC2R2 = 7

Cf1_dstelat = wC1R1/(314*R01)
Cf2_dstelat = wC2R2/(314*R02)
Cf3_dstelat = Cf2_dstelat

fprintf('\nValoarea final? a condensatorului de filtraj in [F]\n');
Cf21_barat = (Cf1_stelat+Cf1_dstelat)/2
Cf22_barat = (Cf2_stelat+Cf2_dstelat)/2
Cf23_barat = (Cf3_stelat+Cf3_dstelat)/2


% Partea B
%Ui_barat(1)=ku1*sqrt(2)*U(1);
%Ui_barat(2)=ku2*sqrt(2)*U(2);
%Ui_barat(3)=Ui_barat(2);
%for i=1:3
    %Cfi_barat(i)=(Cf1_stelat(i)+C0)/2; %asta nu
%    Ui_barat_max(i)=sqrt(2)*U(i);
%    Vo_barat(i)=0.5*Ui_barat(i);
%    Io_N_barat(i)=Vo_barat(i)/Rs(i);
%    delta_IL(i)=0.2*Io_N_barat(i);
%    delta_Vo(i)=(2/100)*Vo_barat(i)
%end


fc = 20; %khz

deltaIL = 0.536;


Uimax = 19.34;

L = (Uimax - 9.6732) * 0.5 / 10 / deltaIL
C = 0.5 * deltaIL / 10 / 0.1935

%D2
UA = 1.25 * Uimax
IA = 1.5 * I01

Vostelat = 0.5 * 0.2 * 19.3
