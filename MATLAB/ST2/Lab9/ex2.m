%% discretization

Hc=tf(500*[1 410],conv([1 210],[1 320])); 
Te=max([1/210,1/320])/10;% establish sampling period 
Hd=c2d(Hc,Te,'zoh')

%% ex 2
zpk(Hd)

%% ex 3
format long
[num,den]=tfdata(Hd,'v')


%% ex 4

step(Hc,Hd);
legend('Hc','Hd')

%% ex 5
[y,t]=step(Hd); 
step(Hc);hold;stem(t,y,'r');hold 
legend('Hc','Hd');

%% ex 6
Hdexact = tf(num,den,Te);
Hd4=tf([0 0.2312 -0.1902],[ 1 -1.7634 0.7769],Te);
Hd3=tf([0 0.231 -0.190],[ 1 -1.763 0.776],Te); 
Hd2=tf([0 0.23 -0.19],[ 1 -1.76 0.77],Te); 
step(Hdexact,Hd,Hd4,Hd3,Hd2);shg
legend('Hdexact','15 zecimale','4 zecimale','3 zecimale','2 zecimale')