clear;
clc;
%DATE INITIALE
U1=220;
U21=16;
U22=26;
U23=U22;
I21=5;
I22=3;
I23=I22;

%Puterea totala ?n secundar
fprintf('\n----------PUTEREA TOTALA IN SECUNDAR----------\n');
S2=(U21*I21) + (U22*I22) + (U23*I23); %[W]
P2=S2;
fprintf('Puterea totala ?n secundar P2=%6.4f\n',P2);

%Puterea de gabarit
fprintf('\n----------PUTEREA DE GABARIT----------\n');



ntr = 0.9236;


J = 1.346;

Pg=(P2/2)*(1+1/ntr);
fprintf('\nPuterea de gabarit:\nPg=%6.4f\n',Pg);


%Calculul sec?iunii miezului de fier
fprintf('\n----------CALCULUL SECTIUNII MIEZULUI DE FIER----------\n');

%constanta din fata radicalului este intre 1.1 si 1.5, trebuie aleasa
SFe=1.3*sqrt(Pg*((1+ntr)/(J*ntr))); %[cm^2]
fprintf('\nCalculul sec?iunii miezului de fier:\nSFe=%6.4f\n',SFe);

%Alegerea tipului tolei
fprintf('\n----------ALEGEREA TIPULUI TOLEI----------\n');

l=sqrt(SFe); %in [cm]
fprintf('\nLatimea tolei calculata prin realizarea unei sec?iuni ?p?trate? a miezului: \nl=%2.2f\n',l);
if (l>3.4 && l<=3.8)
    l=3.6; fprintf('\nLatimea aleasa din tabel pentru tole, dat in [cm]: \nl=%2.2f\n',l);
end

h=l;  %realizarea unei sec?iuni ?p?trate? a miezului (inaltimea)
fprintf('\nInaltimea este egal cu latimea pentru ca incercam sa realizam o sectiune "patrate" a miezului:\nh=%2.2f\n',h);

b=l;  %grosimea pachetului de tole
fprintf('\nGrosimea pachetului de tole in [cm]:\nb=%2.2f\n',b);

bfinal=1.1*b;  %pentru a tine cont de izolatia dintre tole, constanta din fata se alege dintre 1.1 si 1.25
fprintf('\nTinand cont de izolatia dintre tole, grosimea finala a pachetului de tole in [cm] este:\nb*=%5.4f\n',bfinal);

fprintf('\nTolele au grosimea urmatoare, dat in [cm]:\ng=0.035\n');
g=0.035;
Ntole=bfinal/g; %numarul de tole
Ntole=round(Ntole);
fprintf('\nNumarul de tole rotunjit la cel mai apropiat intreg este:\nNtole=%6.0f\n',Ntole);

SFefinal=l*bfinal;  %in [cm^2]
fprintf('\nValoarea finala a sectiunii miezului in [cm^2]:\nSFe*=%6.4f\n',SFefinal);

%Lungimea spirei medii

Imed = 8*l/4+2*l+2*bfinal;  %in [cm]
Imed = round(Imed);
Imed = Imed/100;  %transformat in metri , [m]
fprintf('\nLungimea spirei medii rotunjit la cel mai apropiat intreg si dat in [m]:\nImed=%6.4f\n',Imed);


%Calculul ?nf??ur?rilor transformatorului
  %Pentru ?nf??ur?rile secundare:
    fprintf('\n----------?NFASURAREA SECUNDARA----------\n');
    %aria sec?iunii conductorului circular de cupru:
      fprintf('\nAria sec?iunii conductorului circular de cupru in [mm^2]:\n');
      SCu21 = I21/J %in [mm^2]
      SCu22 = I22/J
      SCu23 = I23/J
    %diametrul spirelor
      fprintf('\nDiametrul spirelor in [mm]:\n');
      d21 = sqrt(4*SCu21/pi)
      d22 = sqrt(4*SCu22/pi)
      d23 = sqrt(4*SCu23/pi)  %in [mm]
      
  %Pentru ?nf??urarea primara curentul primar calculat va fi:
    fprintf('\n----------?NFASURAREA PRIMARA----------\n');
    I1=Pg/U1;
    fprintf('\nCurentul primar calculat in [A]:\nI1=%6.4f\n',I1);
    SCu1=I1/J;
    fprintf('\nAria sec?iunii conductorului circular de cupru in [mm^2]:\nSCu1=%6.4f\n',SCu1);
    d1=sqrt(4*SCu1/pi);
    fprintf('\nDiametrul spirelor in [mm]:\nd1=%6.4f\n',d1);
    
    d = [0.07 0.10 0.12 0.15 0.18 0.20 0.22 0.25 0.28 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1 1.2 1.4 1.5 1.6 1.8 2];  
    
    min1 = abs(d21-d(1));
      for i = 2:30 
          if (abs(d21-d(i))<min1)
              min1 = abs(d21-d(i));
              position = i;
          end
      end    
    d21 = d(position);
    
    min1 = abs(d22-d(1));
      for i = 2:30 
          if (abs(d22-d(i))<min1)
              min1 = abs(d22-d(i));
              position = i;
          end
      end
    d22 = d(position);
     
    min1 = abs(d23-d(1));
      for i= 2:30 
          if (abs(d23-d(i))<min1)
              min1 = abs(d23-d(i));
              position = i;
          end
      end
    d23 = d(position);
     
     min1 = abs(d1-d(1));
      for i= 2:30 
          if (abs(d1-d(i))<min1)
              min1 = abs(d1-d(i));
              position = i;
          end
      end
     d1 = d(position);
    
     
     
     fprintf('\nValorile alese pentru diametrul spirelor in [mm]:\nd*21=%2.2f\nd*22=%2.2f\nd*23=%2.2f\nd*1=%2.2f\n',d21,d22,d23,d1);
     
     %Calculul tensiunii electromotoare induse ?ntr-o spir?
     fprintf('\n----------CALCULUL TENSIUNII ELECTROMOTOARE INDUSE INTR-O SPIRA----------\n');
     em = 4.44*50*1.1*(0.9*SFefinal)*10^(-4);
     fprintf('\nTensiunea electromotoare intr-o spira, in [V/spira]:\ne=%6.4f\n',em);
     
     %Numarul de spire
     fprintf('\n----------NUMARUL DE SPIRE----------\n');
       %in infasurarea primara
         fprintf('\nNumarul de spire in infasurarea primara:\n');
         w1 = U1/em;
         w1 = round(w1)
       %in infasurarea secundara
       
         fprintf('\nNumarul de spire in infasurarea secundara:\n');
         w21 = round(U21/em)
         w22 = round(U22/em)
         w23 = round(U23/em)
         
         
         
     %Rezisten?ele ohmice ale bobinajelor transformatorului
     fprintf('\n----------REZISTENTELE BOBINAJELOR----------\n');
       %in infasurarea primara
         fprintf('\nRezistenta in infasurarea primara in [ohm]:\n');
         p = 0.0172;  %rezistivitatea nominal? a cuprului in [ohm*mm^2/m]
         R1 = w1*p*(Imed/SCu1)
       %in infasurarea secundara
         fprintf('\nRezistenta in infasurarea secundara in [ohm]:\n');
         R21 = w21*p*(Imed/SCu21)
         R22 = w22*p*(Imed/SCu22)
         R23 = w23*p*(Imed/SCu23)
         
       %Rezistentele secundare ?raportate? (totale) sunt:
         fprintf('\nRezistenta in infasurarea secundara "raportate" (totale) in [ohm]:\n');
         R21_stelat = R21+R1*(w21/w1)^2
         R22_stelat = R22+R1*(w22/w1)^2
         R23_stelat = R23+R1*(w23/w1)^2
         
       %Rezisten?ele de sarcin? ?nominale? 
         fprintf('\nRezisten?ele de sarcin? ?nominale? in [ohm]:\n');
         Rs21n = U21/I21
         Rs22n = U22/I22
         Rs23n = U23/I23
         
       %Recalcularea num?rului de spire ale ?nf??ur?rilor secundare
       fprintf('\nRecalcularea num?rului de spire ale ?nf??ur?rilor secundare in [spire]:\n');
       e21 = U21
       e22 = U22
       e23 = U23
       dU21 = R21_stelat*I21
       dU22 = R22_stelat*I22
       dU23 = R23_stelat*I23
       e21_stelat = e21 + dU21
       e22_stelat = e22 + dU22
       e23_stelat = e23 + dU23
       w21_stelat = w21 + (R21_stelat*I21/em);
       w22_stelat = w22 + (R22_stelat*I22/em);
       w23_stelat = w23 + (R23_stelat*I23/em);
       w21_stelat = round(w21_stelat)
       w22_stelat = round(w22_stelat)
       w23_stelat = round(w23_stelat)
      
%Calculul expeditiv al transformatoarelor de mic? putere folosind nomograme       
  fprintf('\n----------CALCULUL EXPEDITIV AL TRANSFORMATOARELOR DE MICA PUTERE----------\n'); 
  fprintf('\nPuterea secundara:\n');
  P2_simplu = U21*I21 + U22*I22 + U23*I23
  P = (1/ntr)*P2_simplu;
  fprintf('\nPuterea calculata prin calcul simplificat:\nP=%6.4f\n',P);
  SFe_simplu=1.3*sqrt(P*((1+ntr)/(J*ntr)));
  fprintf('\nCalculul sec?iunii miezului de fier prin calcul simplificat:\nSFe_simplu=%6.4f\n',SFe_simplu);
  e_simplu = 4.44*50*1.1*(0.9*SFe_simplu)*10^(-4);
  fprintf('\nTensiunea electromotoare intr-o spira, in [V/spira]:\ne_simplu=%6.4f\n',e_simplu);
  N0 = w1/U1;
  N0 = round(N0);
  fprintf('\nNum?rul de spire pe volt pentru ?nf??urarea primar? ,[spire/V]:\nN0=%6.4f\n',N0);
  fprintf('\nNum?rul de spire pe volt pentru ?nf??ur?rile secundare,[spire/V]:\n');
  N021 = w21/U21;
  N022 = w22/U22;
  N023 = w23/U23;
  N021 = round(N021)
  N022 = round(N022)
  N023 = round(N023)
  
 
  
  
  
  
  
%Calculul circuitelor de redresare  
fprintf('\n----------A.2. CALCULUL CIRCUITELOR DE REDRESARE----------\n');
sigma = 1.5; %coficient de siguranta
Uinv21 = sqrt(2)*U21
fprintf('\nTensiunea inversa in infasurarea secundara (w21) in [V]:\nUinv21=%6.4f\n',Uinv21);
fprintf('\nTensiunea inversa in infasurarea secundara (w22 si w23) in [V]:\n');
Uinv22 = 2*sqrt(2)*U22
Uinv23 = Uinv22

fprintf('\nPentru alegerea diodelor, valorile acoperitoare de catalog se refer? la valorile (tau=1.5 ):\n');
Uinv21_stelat = 1.5*sqrt(2)*U21
Uinv22_stelat = 1.5*2*sqrt(2)*U22
Uinv23_stelat = Uinv22_stelat

fprintf('\nCurentul redresat de durat? va fi, pentru ambele variante:\n');
I21_baratstelat = 0.7*I21
I22_baratstelat = 0.7*I22
I23_baratstelat = 0.7*I23

fprintf('\nPentru alegerea diodelor (pun?ilor) se consider? valorile:\n')
I21_stelat = 1.5*0.7*I21
I22_stelat = 1.5*0.7*I22
I23_stelat = 1.5*0.7*I23

fprintf('\nVerificarea redresoarelor la curentul de pornire:\n');
fprintf('\nVa rog sa alegeti valoarea pentru rd in conformitate cu ID, cel ales la diode:')
rd1 = -12/501+0.24
rd2 = -0.84*20/201+0.4

Cf1 = 4*10^(-3)  %[F]
Cf2 = 6*10^(-3)  %[F]
Cf3 = 6*10^(-3)  %[F]
fprintf('\nValoarea curentului ?de pornire? este:\n');
ID21 = (sqrt(2)*U21)/(R21_stelat+2*rd1)
ID22 = (sqrt(2)*U22)/(R22_stelat+rd2)
ID23 = (sqrt(2)*U23)/(R23_stelat+rd2)

fprintf('\nDurata ?nc?rc?rii ini?iale a condensatorului de filtraj:\n');
dt1_stelat = (R21_stelat+2*rd1)*Cf1
dt2_stelat = (R22_stelat+rd2)*Cf2
dt3_stelat = (R23_stelat+rd2)*Cf3

fprintf('\nSolicitarea termic? a diodei la ?nc?rcarea ini?ial? este:\n');
I2pdt1 = ((2*U21^2)/(R21_stelat+2*rd1))*Cf1
I2pdt2 = ((2*U22^2)/(R22_stelat+rd2))*Cf2
I2pdt3 = ((2*U23^2)/(R23_stelat+rd2))*Cf3

fprintf('\n----------A.3.CALCULUL FILTRELOR DE NETEZIRE----------\n');
e21_stelat
e22_stelat
U21_barat = 0.9*e21_stelat-1.5
U22_barat = 0.9*e22_stelat-0.75
U23_barat = U22_barat
p_i = 67;
p0 = 8
q = p_i/p0

fprintf('\nPe baza rezisten?ei nominale de sarcin? ?i a rezisten?ei totale a redresorului\n');
Rrt1 = R21_stelat+2*rd1
Rrt2 = R22_stelat+rd2
Rrt3 = R23_stelat+rd2

fprintf('\nValoarea necesar? a condensatorului de filtraj, in [F]:\n');
Cf1_stelat = ((1600*q*(Rrt1+Rs21n))/(Rrt1*Rs21n))*10^(-6)   %[F]
Cf2_stelat = ((1600*q*(Rrt2+Rs22n))/(Rrt2*Rs22n))*10^(-6)
Cf3_stelat = ((1600*q*(Rrt3+Rs23n))/(Rrt3*Rs23n))*10^(-6)


fprintf('\nDeterminarea coeficientului de tensiune (ku), din nomograma A.3.2a:\n');
Rr1 = Rrt1
R01 = Rs21n
C01 = Cf1_stelat
E01 = 1.41*e21_stelat-1.5
wC01R01 = 314*C01*R01
kr1 = Rr1/R01

Rr2 = Rrt2
R02 = Rs22n
C02 = Cf2_stelat
E02 = 1.41*e22_stelat-0.75
wC02R02 = 314*C02*R02
kr2 = Rr2/R02

Rr3 = Rrt3
R03 = Rs23n
C03 = Cf3_stelat
E03 = 1.41*e23_stelat-0.75
wC02R02 = 314*C02*R02
kr3 = Rr3/R03

fprintf('\nAceste valori sunt alese de mine, pentru datele mele!!! Voi trebuie sa alegeti in functie de wC0R0 si Rr-ul vostru!!!!!!!!!\n');
ku1 = 0.65      %trebuie citit de pe graficul A.3.2a in functie de 
ku2 = 0.59

U01 = ku1*E01
U02 = ku2*E02
U03 = ku2*E03


fprintf('\nCalculul direct (prin nomograme) a valorii condensatorului de filtraj:\n');
fprintf('\nFactorul de pulsatie impus in [%]:\np0=%6.4f\n',p0);
fprintf('\nM?rimi auxiliare de calcul:\na.)\n');
Rs1 = R01
rsv1 = Rrt1
fprintf('\nrsv1/Rs1=%6.4f\nb.)\n',rsv1/Rs1);
Rs2 = R02
rsv2 = Rrt2
fprintf('\nrsv2/Rs2=%6.4f\n',rsv2/Rs2);
wC1R1 = 7    %ales de mine din graficul  A3.2.b
wC2R2 = 7

Cf1_dstelat = wC1R1/(314*R01)
Cf2_dstelat = wC2R2/(314*R02)
Cf3_dstelat = Cf2_dstelat

fprintf('\nValoarea final? a condensatorului de filtraj in [F]\n');
Cf21_barat = (Cf1_stelat+Cf1_dstelat)/2
Cf22_barat = (Cf2_stelat+Cf2_dstelat)/2
Cf23_barat = (Cf3_stelat+Cf3_dstelat)/2

fprintf('n\Tensiunea de lucru a condensatoarelor va fi egal? cu tensiunea invers? de catalog a diodelor (pun?ilor)!!!');

fprintf('\n----------A.3.3 CALCULUL EXPEDITIV AL UNUI REDRESOR NESTABILIZAT----------\n');
fprintf('\nDate initiale pentru calculul expeditiv:\n');
U021_barat = U21
U022_barat = U22
U023_barat = U23
I021_barat = I21
I022_barat = I22
I023_barat = I23
p01 = 8 % in [%]
p02 = 8
p03 = 8

fprintf('\nSe calculeaz? rezisten?a de sarcin? nominal?:\n');
R021_barat = U021_barat/I021_barat
R022_barat = U022_barat/I022_barat
R023_barat = U023_barat/I023_barat

fprintf('\nRezisten?a echivalent? ?total??:\n');
alfa = 0.04;
rrv1 = alfa*R021_barat + 2*rd1
rrv2 = alfa*R022_barat + rd2
rrv3 = alfa*R023_barat + rd2
A1 = rrv1/R021_barat
A2 = rrv2/R022_barat
A3 = rrv3/R023_barat
fprintf('\nCondensatoare in [F]:\n');
C01 = 7/(314*R021_barat)
C02 = 7/(314*R022_barat)
C03 = 7/(314*R023_barat)
kr_1 = A1
kr_2 = A2
kr_3 = A3

E01_barat = U021_barat/0.65 %[V]
E02_barat = U022_barat/0.59
E03_barat = U023_barat/ku2

fprintf('\nTensiunile secundare ale transformatoarelor in [V]:\n');
U21_tilda = (E01_barat+1.5)/1.41
U22_tilda = (E02_barat+0.75)/1.41
U23_tilda = (E03_barat+0.75)/1.41
























