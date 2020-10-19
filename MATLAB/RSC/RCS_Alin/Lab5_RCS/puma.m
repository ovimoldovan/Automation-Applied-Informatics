%%mdl_puma560();
%%p560;
T=p560.fkine([0.1,0.5,0.1,0.8,0.1,0.2]);
J=p560.jacobn(T);
q=[1; 1.4; 1.7; 0.2; 0.3; 0.1];
xsi=J*q;
xsi2=[2;0;0;0;0;0];
invJ=inv(J);
q=invJ*xsi2;