%% initial data
format 
%groupPower
P = 139; %[MW]
%livingSteamPressure
p = 103; %[bar]
%thermalEfficiency
invn0 = 2380; %[Mcal/MWh]
%enthalpy
i2 = 790; %[Mcal/to]
%% Thermal part
%Nominal power of the generator
PGnom = P; %[MW]
%Nominal pressure of the living steam in the boiler
Pabvnom = p;
%Thermic specific consumption = invn0 Mcal/MWh
%processed steam enthalpy = i2 Mcal/to
%Methane gas caloric power
PCCH4 = 8.5; %[MCal/Nm^3] -> normal metru cub
%Nominal gas flow (=qCH4nom)
qCnom = invn0 * PGnom/PCCH4
qCH4nom = qCnom;
%Nominal value of the processed steam
thetaAbNom = 530; %[*C]
%Molecular oxygen contained in the burned gas
O2 = 5; %[%]
%Nominal pressure of the steam in the drum
Pabvtnom = 1.1 * Pabvnom %[bar]
%nominal temp of the steam after the first superheater
thetaAbsiNom = 480; %[*C]
%nominal combustion air flow nominal
alpha = 1.1; %excess combustion air
a = 1.09; b = 0.25; %coefficients that depend on the gas composition
qAerNom = qCnom * alpha * (a * PCCH4*1000/1000 + b) %[Nm^3/h]
%nominal thermal depressure
deltaPfNom = -2; %[mmH20]
%burned gas flow
qGaNom = qCH4nom + qAerNom
%nominal processed steam flow
i1 = 30; %[MCal/t] thermal energy contained in the pressurized water
qAbvNom = invn0 * PGnom / (i2-i1)
qAbViu = qAbvNom;
%feedwater flow
qApaNom = qAbvNom;
%nominal salinity
Snom = 10^-8; %[kg/t]
%injection flow
qijNom = 10^-2 * qAbvNom %[t/h]
%purge flow
qpjNom = 10^-3 * qAbvNom

%% Electric part
cosfi = 0.825;
% Apparent power
SGnom = PGnom / cosfi %[MVA]
%Nominal reactive power
QGnomsquared = SGnom^2 - PGnom^2
QGnom = sqrt(QGnomsquared)
%Generator terminals tension
UGnom = 15; %[kV]
%Nominal excitation tension
UEnom = 300; %[V]
UPcnom = 270;
Tee = 0.1;
Te = 0.5;
Tg = 4;
%Exciter nominal power
%PEnom = 0.0025 * PGnom
PEnom = 0.3; %[MW]
%Controlled bridge nominal power
PPCnom = 0.003; %[kW]
%Excitaion nominal current
iEnom = 0.001; %[kA]
%Controlled bridge nominal tension
UPCnom = 270; %[V]
%Exciter excitation time constant
Tee = 0.1; %[sec]
%The time constant of the generator's excitation 
Te = 0.5; %[sec]
%The time constant of a three phased generator
Tg = 4; %[sec]
%The current of the bridge rectifier
iPcnom = 0.000001; %[A]

%% Transfer functions
%1. Tf of the steam's pressure with regart to the fuel flow
k11 = Pabvnom/qCnom
Tm11 = 600; T11 = 6000;
H11 = tf(k11, [T11, 1], "InputDelay", Tm11)
%2. Transfer function of O2 content from exhaust in relation to the fuel
%flow
k12 = O2/qCnom
Tm12 = 10; T12 = 60;
H12 = tf(k12, [T12, 1], "InputDelay", Tm12)
%3. Transfer function of the processed steam in the drum, in relation to
%the fuel flow
k15 = (1.1 * Pabvnom)/qCnom
Tm15 = 540; T15 = 5400;
H15 = tf(k15, [T15, 1], "InputDelay", Tm15)
%4. Transf func of the processed steam flow in relation to the fuel flow
k16 = qAbvNom / qCnom
Tm16 = 720; T16 = 7200;
H15 = tf(k16, [T16, 1], "InputDelay", Tm16)
%5. Tf of the steam temp in the intermediary over-heater in relation to the
%fuel flow
k17 = thetaAbsiNom/qCnom
Tm17 = 600; T17 = 6000;
H17 = tf(k17, [T17, 1], "InputDelay", Tm17)
%6. Tf of the processed steam temperature in relation to the fuel flow
Tm18 = 720; T18 = 7200;
k18 = thetaAbNom/qCnom
H18 = tf(k18, [T18, 1], "InputDelay", Tm18)
% PANA AICI E SCRIS IN DOC
%
%
%
%

%7. 
Tm21 = 600; T21 = 6000;
k21 = Pabvnom/qAerNom
H21 = tf(k21, [T21, 1], "InputDelay", Tm21)
%8.
Tm22 = 10; T22 = 60;
k22 = O2/qAerNom
H22 = tf(k22, [T22, 1], "InputDelay", Tm22)
%9.
Tm23 = 10; T23 = 5;
k23 = deltaPfNom/qAerNom
H23 = tf(k23, [T23, 1], "InputDelay", Tm23)
%10.
k25 = Pabvnom * 1.1 / qAerNom
Tm25 = 540; T25 = 5400;
H25 = tf(k25, [T25, 1], "InputDelay", Tm25)
%11
Tm26 = 720; T26 = 7200;
k26 = qAbvNom/qAerNom
H26 = tf(k26, [T26, 1], "InputDelay", Tm26)
%12
Tm27 = 600; T27 = 6000;
k27 = thetaAbsiNom/qAerNom
H27 = tf(k27, [T27, 1], "InputDelay", Tm27)
%13
Tm28 = 720; T28 = 7200;
k28 = thetaAbNom/qAerNom
H28 = tf(k28, [T28, 1], "InputDelay", Tm28)
%14
Tm33 = 5; T33 = 10;
k33 = deltaPfNom/qGaNom
H33 = tf(k33, [T33, 1], "InputDelay", Tm33)
%15
Tm44 = 20; T44 = 20; hnom = 0.1;
k44 = hnom/qApaNom
H44 = tf(k44, [T44, 1], "InputDelay", Tm44)
%16
Tm46 = 720; T46 = 7200;
k46 = qAbvNom/qApaNom
H46 = tf(k46, [T46, 1], "InputDelay", Tm46)
%17
Tm49 = 3600; T49 = 36000;
k49 =Snom / qApaNom
H49 = tf(k49, [T49, 1], "InputDelay", Tm49)
%18
Tm57 = 10; T57 = 10;
deltaThetaAbsiNom = 100;
k57 = -deltaThetaAbsiNom/qijNom
H57 = tf(k57, [T57, 1], "InputDelay", Tm57)
Tm69 = 60; T69 = 60;
deltaSnom = 1;
k69 = -deltaSnom/qpjNom
H69 = tf(k69, [T69, 1], "InputDelay", Tm69)

%% electric
kcip12 = 0.1;
ke12 = qCnom/0.8
Te12 = 1;
HE12 = tf(ke12, [Te12, 1])


Tsigma12=0.01;
TE12 = 1;KEX12 = 1;

kM12 = 8/qCnom
HEX12 = tf(KEX12, conv([Te12, 1], [Tsigma12, 1]))
HR12 = tf([TE12, 1], [2*Tsigma12, 0])
Vr = 50; Ti = 0.02;

Kcpi11 = 8/Pabvnom
K = Kcpi11;
Vr11 = 0.8 * 6000 / 600;
Ti11 = 1800;
HR11 = tf([8*1800 1], [1800 0])

%B

kcpi43 = 0.1
Hcpi43 = tf(kcpi43)

ke43 = qApaNom/0.8
Te43 = 1;
He43 = tf([ke43],[Te43, 1])

km43 = 8/qApaNom
km41 = 8/qAbvNom


kcip43 = 0.1
Hcip43 = tf(kcip43)
HprimExt43 = tf( kcip43 * ke43 * km43, [Te43, 1])

Tsigma43 = 0.01;
Hext43 = HprimExt43 * tf(1, [Te43])
HR43 = minreal(tf(1, [2*Tsigma43^2 2*Tsigma43 0])*(1/Hext43))
Vr43 = 1/2/Tsigma43
Ti43 = 2*Tsigma43

mqabvnom = 0.1;
cqabvnom = 10;
kSMH = mqabvnom/cqabvnom

TiSMH = 20;
HSMH = tf([TiSMH*kSMH 1], [TiSMH 0])

kv = qAbvNom/mqabvnom
Hv = kv

kTG = PGnom/qAbvNom
TTG = 10

HTG = tf(kTG, [TTG 1])

kp = 10/P
kf = 0.2

df = 0.4
S = -df/PGnom

f = 50
Pg = PGnom
alpha = S

HEx1 = minreal(HSMH*Hv*HTG)
Hd = minreal(HEx1 * kp)

Tsigma = 0.01
HEx = minreal(Hd * tf(1, [Tsigma, 1]))
HRP = zpk(minreal(tf(1, [2*Tsigma^2 2*Tsigma 0])/HEx))

Ks = -1/(0.02*PGnom*S)

IGnom=SGnom/sqrt(3)/UGnom

%Tee
kee = UEnom/UPcnom
Hee = tf(kee, [Tee, 1])

%Te
ke = iEnom*1000/UEnom
He = tf(ke, [Te 1])


%gen
kG = IGnom/UGnom
kEG = UGnom/iEnom
HG = tf(kG, [Tg 1])

%compoundation
kUG = 10/UGnom/1000
kIG = 0.5/IGnom
kIE = 10/iEnom/100
kUE=10/UEnom

%bucla interna A
%KCCGPC = UPCnom/90 * 11.25 33.75
KCCGPC = 33;
HprimEx = tf(kee, [Tee 1]) * KCCGPC * kUE
HExA = minreal(HprimEx * tf(1, [Tsigma 1]))
%HRUE = zpk(minreal(1,[2*Tsigma^2 2*Tsigma 0])/HExA)
HRUE = minreal(tf(1, [2*Tsigma^2 2*Tsigma 0])/HExA)

%pidstd pt constante


% B
H1 = minreal(HRUE*KCCGPC*Hee/(1+HRUE*KCCGPC*Hee*kUE))

HsecEx = minreal(He * kIE * H1)
HExB = minreal(HsecEx*tf(1, [Tsigma 1]))
HRIE = minreal(tf(1, [2*Tsigma^2 2*Tsigma 0])/HExB)

%C

H2 = zpk(minreal(HRIE*H1*He/(1+HRIE*H1*He*kIE)))
Hreactie = kUG - HG * kIG
Hdirect = zpk(H2 * kEG)
HExC = (Hreactie * Hdirect * tf(1, [Tsigma 1]))

HRUG = zpk(tf(1, conv([Tsigma, 1], [2*Tsigma, 0]))/HExC)










