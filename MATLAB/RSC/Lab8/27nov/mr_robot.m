function out = mr_robot(input)
    tau = input(1:2);
    q1 = input(3);
    q2 = input(4);
    qd1 = input(5);
    qd2 = input(6);
    kp1=0;
    kp2=0;
    kd1=0;
    kd2=0;
    kn1=0;
    kn2=0;
    D=[0.003515*cos(q2) + 0.000925*cos(q2)^2 + 0.026254,        0;
         0, 0.023625];

    C=[0.24 - 0.0017575*qd2*sin(q2) - 0.0004625*qd2*sin(2.0*q2), - 0.0004625*qd1*sin(2.0*q2) - 0.0017575*qd1*sin(q2);
       0.0004625*qd1*sin(2.0*q2) + 0.0017575*qd1*sin(q2),                                                0.16];

    G = [(-0.1815*cos(q2)-0.1376)*sin(q1);
                                    -0.18149*cos(q1)*sin(q2)];
    w1=1.1;
    w2=1.1;
    kp1=D(1,1)*w1^2;
    kp2=D(2,2)*w2^2;
    kd1=2*w1*D(1,1)-C(1,1);
    kd2=2*w2*D(2,2)-C(2,2);
    kn1=kd1*10;
    kn2=kd2*10;
    
    ddq=D\(tau-C*[qd1;qd2]-G);

    out=[ddq; kp1; kp2; kd1; kd2; kn1; kn2];

end