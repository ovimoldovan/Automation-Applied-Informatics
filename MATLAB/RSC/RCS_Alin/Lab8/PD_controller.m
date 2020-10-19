function PD1 = PD_controller(in)
q1 = in(1);
wn1 = in(2);
q2 = in(3);
qd2 = in(4);
d11 = 0.003515*cos(q2) + 0.000925*cos(q2)^2 + 0.026254;
c11 = 0.24 - 0.0017575*qd2*sin(q2) - 0.0004625*qd2*sin(2.0*q2);
kp1 = d11*wn1^2;
kd1 = 2*wn1*d11-c11;
PD1 = [kp1,kd1];
end