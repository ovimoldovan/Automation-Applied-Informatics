function PD2 = PD_controller2(in)
q2 = in(1);
wn2 = in(2);
d22 = 0.023625;
c22 = 0.16;
kp2 = d22*wn2^2;
kd2 = 2*wn2*d22-c22;
PD2 = [kp2,kd2];
end