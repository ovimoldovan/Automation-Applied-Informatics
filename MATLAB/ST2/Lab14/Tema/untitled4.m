Ra=0.92; La=2e-3; Ke=0.2960; Kt=0.2939; Bf=3.35e-4;J=7.01e-4;Kpwm=384615;
A=[-Ra/La, -Ke/La, 0; Kt/J, -Bf/J, 0;0, 1, 0]; B=[Kpwm/La, 0; 0 -1/J;0 0];
C=[0, 1, 0];
D=[0, 0];

%% Simularea rasp la treapta
Tmax=max(real(abs(1/eig(A))))
% cea mai mare constant? de timp 140 
T_stationar=6*Tmax;
pas=T_stationar/100;
t=0:pas:T_stationar;  
ua=ones(1,length(t));Tl=ua*0;
u=[ua;Tl];
sist=ss(A,B,C,D);
[y,t,x]=lsim(sist,u,t,[0, 0, 0]);
plot(t,x);grid
legend('i_a','\omega','\theta')
xlabel('Timp (sec.)');
title('Raspunsul la treapta, 20 functionare in gol')
%% Functionarea in sarcina a motorului
t=0:1e-3:0.5;
ua=ones(1,length(t)); Tl1=0.1;Tl2=0.3; Tl=0.4*(zeros(1,length(t))+t<=Tl2); u=[ua;Tl];
plot(t,u');grid;
axis([0 0.5 -0.1 1.2]);
legend('u_a','T_L');
title('Semnalul de intrare') ;
xlabel('Timp (sec.)') ;

%% eliminarea erorii la pozitie
A=[-Ra/La, -Ke/La; Kt/J, -Bf/J];
B=[Kpwm/La, 0; 0 -1/J];
C=[0, 1];
D=[0, 0];

sist=ss(A,B,C,D);
t=0:1e-3:0.05;
u=[ones(1,length(t));zeros(1,length(t))]; 

Fx=inv((C*inv(-A)*B(:,1))); 
[y,t,x]=lsim(sist,u*Fx,t); 
plot(t,x);legend('i_a','\omega');grid

%% reducerea cu 10% a timpului de stabilizare

eig(A);
p = eig(A) + 1/10*eig(A);
Co=ctrb(A,B( :, 1));
R=rank(Co)

Kx=acker(A,B(:,1),p)


Ar=A-B(:,1)*Kx; Br=B;  Cr=C; Dr=D;

% Controller
sist2 = ss(Ar,Br,Cr,Dr);
Fx=inv((Cr*inv(-Ar)*Br(:,1))); 
[y,t,x]=lsim(sist2,u*Fx,t); 
plot(t,x);legend('i_a','\omega');grid
figure(2)

% State observer
L = acker(A',C',p)
Al = A'-C'*L;

sist3 = ss(Al,Br,Cr,Dr);
Fx=inv((Cr*inv(-Al)*Br(:,1))); 
[y,t,x]=lsim(sist3,u*Fx,t); 
plot(t,x);legend('i_a','\omega');grid



