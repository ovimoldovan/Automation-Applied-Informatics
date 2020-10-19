function Tau = ComputedTau( input )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

q1 = input(3);
q2 = input(4);
qd1 = input(5);
qd2 = input(6);

    D=[0.003515*cos(q2) + 0.000925*cos(q2)^2 + 0.026254,        0;
         0, 0.023625];

    C=[0.24 - 0.0017575*qd2*sin(q2) - 0.0004625*qd2*sin(2.0*q2), - 0.0004625*qd1*sin(2.0*q2) - 0.0017575*qd1*sin(q2);
       0.0004625*qd1*sin(2.0*q2) + 0.0017575*qd1*sin(q2),                                                0.16];

    G = [ (-0.1815*cos(q2) - 0.1376)*sin(q1);
                                    -0.18149*cos(q1)*sin(q2)];
                                
V=C*[qd1;qd2]+G

Tau= D*[input(1);input(2)]+V

 
end

