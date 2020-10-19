%% Modelarea standului de laborator Festo
%% Amplificatorul
ua = 8;
um = 2.2*ua; %caracteristica liniarizata pe tot domeniul de functionare
um = 2.2*ua+5*(ua-8.1) %daca valoarea tensiunii de intrare e mai mare de 8.1V


%% Motorul
% IN: um(0-22) si im
%OUT: turatia n
%Rm = 3; %rezistenta infasurarii rotorice a motorului
%n = 10; %random number
% Ecutatiile motorului in regim stat
% um = Rm*im+em;
% m = mr; cuplul activ = cuplu rezistiv
% em = km*n; tensiunea electromotoare
% m = km*im;

%% Pompa
% IN: turatia kmn, h=nivelul din rezervorul h
%OUT: qi=debitul de intrare in rezervorul principal

% coeficienti-valori constante pentru pompa data
k1p = 3;
k2p = 4;
k3 = 5;
%qi-debit de lichid pompa
k1 = k1p * (km)^2;
k2 = k2p * (km)^2;
Pp = k1*n^2+k2*n*qi+k3*qi^2; %presiunea generata de pompa
Pv = 2*h;
Pc = Pv + k*qi^2; %comportarea instalaltiei, Pv-presiunea statica a consumatorului, kqi^2 caderea dinamica de presiune pe robieti, conducte
k11 = k2^2+4*(k-k3)*k1;
k12 = 4*(k-k3)*Pv;
k13 = 2*(k-k3);
qi = (k2*n+sqrt(k11*n^2-k12))/k13;

%% PARTEA 1

%%h = 0.08;%valoare variabila
k1 = 0.624;
k2 = -0.015;
k3 = -0.0006;
k = 0.035;
k11 = k2^2+4*(k-k3)*k1;
%%k12 = 8*(k-k3)*h;
k12=4*(k-k3)*2;
k13 = 2*(k-k3);

%% Randamentul pompei
%raportul dinte puterea hidraulica dezvoltata in pompa(Ph) si puterea
%electrica pe care o consuma motorul pompei(Pe)
um = 24; %valoarea amxima a tensiunii pe motorul pompei
%qmax = 92cm^3/s %debit max
kn = 8*10^-5;
randament = kn*um*q; %eta

%% Curentul rotoric
im = Ph/um*randament;
im = q*(2*h+k*q^2)/10^4&(um*randament);

%% Rezervorul
C = 9;
qe = C*sqrt(h); %C-un coeficient caee depinde de sectiunea cnoductei de iesire

%% Senzorul de nivel
%h = kSN *upv
%kSN = 3cm/V


%% PARTEA 2
h0 = 10.5; %valoare nivel in regim stationar
qo = 29.2; %debit iesire

%% PI cu overshoot

H = tf([16.208, 16.208*0.040953], [1 0]);





