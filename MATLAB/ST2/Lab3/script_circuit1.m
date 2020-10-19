clear
%R1=1e3;R2=1e3;C1=1e-6;
R1=4.7e3;R2=4.7e3;C1=1e-6; %C=0.1e-6
w=2000; % the frequency in rad/sec. for the input signal 
T=2*pi/w; Te=T/50; % sampling period
sim('circuit1');
%% reading data from simulink
t=data.time; % simulation base
u=data.signals(1,2).values; % input signal
y=data.signals(1,1).values; % output signal
plot(t,u,'r',t,y,'b'); 
title(['Raspunsul circuitului la semnal u(t)=sin(',num2str(w),'t)'])
legend('intrare','iesire');
xlabel('Timp (sec.)')
shg;grid

%% tabel
tabel = [100, 0.884, 0.5341, 0.5698;
        143, 0.807, 0.3735, 0.3994;
        200, 0.7066, 0.267, 0.2864;
        250, 0.6291, 0.2136, 0.2864;
        500, 0.3828, 0.1068, 0.1153;
        1000, 0.2056, 0.0534, 0.05785;
        2000, 0.1048, 0.0267, 0.02898;
        4000, 0.05033, 0.01335, 0.0145;
        5000, 0.03857, 0.01068, 0.01159;
        7000, 0.02487, 0.007629, 0.00826;
        10000, 0.01485, 0.00534, 0.005777]
w = tabel(:,1); %sir de pulsatii de test
Ass = tabel(:,2); %amplitudinea semnalului de iesire in regim stationar;
tu = tabel(:,3); %
ty = tabel(:,4); %

%% prelucrare date
phi_s=tu-ty; %defazaj in secunde
%T = 2*pi./w;
phi_r=phi_s.*w; %defazaj in radiani;
phi_g=rad2deg(phi_r); %sau = 360/2/pi*phi_r;


% nyquist
polar(phi_r, Ass, '-r*')