%% parametrii circuitului
R1=2.2e3;R2=4.7e3;R3=1e3;R4=R3;C1=1e-7;
%% parametrii semnal de intrare
fu=500;Tu=1/fu;w=2*pi*fu;% perioada semnalului de intrare
tfin=7*Tu;% timpul de simulare
%% 
sim('l1c1sin');
t=data.time;
u=data.signals.values(:,2);% semnal de intrare
y=data.signals.values(:,1);% semnal de iesire
plot(t,u,t,y);legend('u(t)','y(t)');grid;shg
