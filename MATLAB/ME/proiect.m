P2=5+0.15*19%[kW] -output power
ns=1500%[RPM] -sychronous speed of motor
i12=2+0.1*19 %transmission ratio
z1=20 % number of teeth first gear
Lh=10000 % [hours] -nummber of running hours

niug=0.97; %spur gear efficiency (0.96->0.98)
niub=0.99; %one pair efficiency (0.99->0.995)
niul=0.99; %lubrification efficiency (0.99)

niu=niug*niub^2*niul

P1=P2/niu %[kW] input power
%%
%Se alege motor dupa urmatorul catalog .Grupa 30321 are motor cu 4 poli
%http://www.umeb.ro/upload/files/carti_tehnice/catalog_motoare_romana.pdf

%ASU-112M-4

P1ales=11; %[kW] DE SCHIMBAT

n1=1440; %turatie nominala motor
n2=n1/i12; 

Mt1=97400*P1ales/n1 %[daN*cm]
Mt2=97400*P2/n2 %[daN*cm]

v=0.1*sqrt(sqrt((n1^2*P1ales*1.34/i12))) %[m/s] -pinion peripheral speed , P1Ales in Horse power

kd=1.2; %dynamic load factor
kc=1.1 %distribution load factor [1->1.22]
k=kd*kc

Mtc1=k*Mt1 %[daN*cm] -computational load input
Mtc2=k*Mt2 %[daN*cm] -computational load output

psiA=0.6 % pentru reductoare
sigmaAK=5122; %OLC 45
L=20; %[grade] - angrenaj necorijat

A =(i12 +1 ) * nthroot(Mtc1*(865^2)/psiA/i12/sin(40)/(5122^2),3) %[cm] distanta axiala


%Din tabelul dat de prof se alege A
Aales=125; % [mm] -distanta axiala aleasa DE SCHIMBAT


z2=z1*i12
m=2*Aales/(z1+z2) % [mm] -modulul rotilor dintate
%%
%Din tabelul dat de prof se alege m
males=3; %[mm]

%Deoarece s-a ales un m , trebuie modificat numarul de dinti

z1n=round(2*Aales/males/(1+i12)); %number of teeth first gear
z2n=round(i12*z1n); %number of teeth second gear

psim=Aales*0.6/males;
Cf=0.1355;


Sigma=(2*Mtc1)/pi/((3)^3)/z1n/psim/Cf/0.9396 %Solicitarea la incovoiere

SigmaAI=4300/1.8/1.8
%%
%Sigma<SigmaAI ->Angrenajul rezista la incovoiere
f0=1;
w0=0.25;
De1=males*(z1n+2*f0) %[mm]
Re1=De1/2; %[mm]
De2=males*(z2n+2*f0) %[mm]
Re2=De2/2; %[mm]
h=males*(2*f0+0.25) %[mm]
Di1=males*(z1n-2*f0-2*w0)%[mm]
Ri1=Di1/2;%[mm]
Di2=males*(z2n-2*f0-2*w0)%[mm]
Ri2=Di2/2;%[mm]
B=Aales*psiA %[mm]
Dd1=males*z1n %[mm]
Dd2=males*z2n %[mm]
Rb1=males*z1n/2*0.40 %[mm]
Rb2=males*z2n/2*0.40 %[mm]
e=(sqrt(Re1^2-Rb1^2)+sqrt(Re2^2-Rb2^2)-Aales*0.91)/pi/males/0.40 %gradul de acoperire
%%
%e>1.2 -> buna functionare

%Se aleg nr1 , nr2

z1n = 18;
z2n = 71;

nr1=3;
nr2=8;
Ln1=males*((nr1-0.5)*pi+z1n*0.014904)*0.9396 %[mm]-cota peste nr1 dinti pentru pinion
Ln2=males*((nr2-0.5)*pi+z2n*0.014904)*0.9396 %[mm]-cota peste nr2 dinti pentru roata condusa

SigmaAT=200; %[daN/cm^2]  (120 ->250)
dp1=nthroot(Mt1/0.2/SigmaAT,3) %   input shaft
dp2=nthroot(Mt2/0.2/SigmaAT,3) %   output shaft
%%

b=Aales*psiA
l1=10;
%l2=0.5*max(dp1,dp2);
l2 = 1*dp2;
l=b+2*l1+l2 %mm //am scos l2*10
%%
Ft1=2*Mt1/(Dd1/10) % daN*cm/ cm ->[daN]
Ft2=2*Mt2/(Dd2/10) % daN*cm/ cm ->[daN]

Fn1=2*Mt1/(Dd1/10)/0.9396 %[daN]
Fn2=2*Mt2/(Dd2/10)/0.9396 %[daN]

Fr1=Ft1*0.3639 %[daN]
Fr2=Ft2*0.3639 %[daN]

%%
Rv2=Ft1/2 %[daN] -reaction force vertical plane input shaft
Rv4=Ft1/2 %[daN] -reaction force vertical plane input shaft

MiVmax=(1/4)*Ft1*l/10 %[daN*cm] - Maximum bending moment vertical plane input shaft

Rh2=Fr1/2 %[daN] -reaction force horizontal plane input shaft
Rh4=Fr1/2; %[daN] -reaction force horizontal plane input shaft

MiHmax=(1/4)*Fr1*l/10  %[daN*cm] - Maximum bending moment horizontal plane input shaft

Rv5=Ft2/2 %[daN] -reaction force vertical plane output shaft
Rv7=Ft2/2;%[daN] -reaction force vertical plane output shaft

MiVmax2=(1/4)*Ft2*l/10 %[daN*cm] -Maximum bending moment vertical plane output shaft

Rh5=Fr2/2 %[daN] -reaction force horizontal plane output shaft 
Rh7=Fr2/2 %[daN] -reaction force horizontal plane output shaft 

MiHmax2=(1/4)*Fr2*l/10 %[daN*cm] -reaction force horizontal plane output shaft 

FR2=sqrt(Rv2^2+Rh2^2) %[daN] - resulting reaction force input shaft
FR4=sqrt(Rv2^2+Rh2^2) %[daN] -rresultin reaction force input shaft

FR5=sqrt(Rv5^2+Rh5^2) %[daN] -resulting reaction force output shaft
FR7=sqrt(Rv5^2+Rh5^2) %[daN] -resulting reaction force output shaft

MiVmax = 480.14
MiHmax = 144.03

Mi=sqrt(MiVmax^2+MiHmax^2) %[daN*cm] - resulting bending moment input shaft
Mo=sqrt(MiVmax2^2+MiHmax2^2) %[daN*cm] -resulting bending moment output shaft
%%

Mei=sqrt(Mi^2+(0.6*Mt1)^2) %[daN] -equivalent bending moment input shaft
Meo=sqrt(Mo^2+(0.6*Mt2)^2) %[daN] -equivalent bending moment output shaft

d1=nthroot(32*Mei/pi/450,3) %[cm]
d2=nthroot(32*Meo/pi/450,3) %[cm]
%%
%Di1>d1  
%Di2>d2 

dci=nthroot(Mt1/0.2/600,3) %[cm]
%se alege din tabel cel mai apropiat

%%

dciales=14; %[mm] DE SCHIMBAT
%seria lunga
lci=30; %[mm]
dei=1.2*dciales; %[mm]

%lli=(0.5 -> 0.8)dp
lei=(0.8)*dp1*10
dri=20 %mm
d4i=20
%%
dco=nthroot(Mt2/0.2/600,3) %[cm]
%Se alege din tabel
%%

dcoales=20; %[mm] DESCHIMBAT
%Seria scurta
lco=36;
deo=1.2*dcoales;

%llo=(0.5 -> 0.8)dp
leo=(0.8)*dp2*10
dro=30; %[mm]
d4o=32; %[mm]
d5=37; %[mm]
l4=50;
%%
%d4o=25 -> tabel
bkeys=10 %mm
hkeys=8%mm

pa=800;
lkey=4*Mt2/(hkeys/10)/(d4o/10)/pa %cm - key length at contact stress
%%
lkeyales=16;%cm DE SCHIMBAT

Sigmaf=2*Mt2/(bkeys/10)/(d4o/10)/lkeyales %[daN/cm^2] -output shaft verification at shear stress

%Sigmaf<960 [daN/cm^2]
%%
E=2.1*1000000 %[daN/cm^2]
I=pi*d4o/10/64 %[cm]
fV=Ft2*(lkeyales)^3/48/E/I %Deflection in vertical plane

fH=Fr2*(lkeyales)^3/48/E/I %Deflection in horizontal plane

f=sqrt(fV^2+fH^2) %Equivalent deflection
fadmis=5*(10^(-3))*males/10
%%
%f<fadm

gama=7.8*10^(-3) %[daN/cm^3]
G=gama*pi/4*(B/10)*(Dd2/10)^2 %[daN] -weight of output gear

fst=G*(l/10)^3/48/E/I %[cm] static deflection

ncr=30/pi *sqrt(9.8/fst) %[rot/min] -critical speed
%%
L1=60*n1*Lh/10^6 %[million of rotations] 

Fe1=1.2*FR2 %[daN]
C1=Fe1*nthroot(L1,3) %[daN]

%model motor ales : 6002 -> C1ales=5.6 kN

L2=60*n2*Lh/10^6 %million of rotations

Fe2=1.2*FR5 %[daN]
C2=Fe2*nthroot(L2,3) %[daN]

%Model 6004 C=9.3 kN