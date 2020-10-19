%% Lab 2 problem1
syms q1 q2 q3 q4 l1 l2 l3 l4
q1 = 0;
q2 = -pi/20;
q3 = pi/20;
q4 = 10;
l1 = 3;
l2 = 2;
l3 = 4;
l4 = 1;
R01 = TransfoMat("r","z",q1);
T01 = TransfoMat("t","z",l1);
H01 = R01*T01;

R12 = TransfoMat("r","x",q2);
T12 = TransfoMat("t","x",l2);
H12 = R12*T12;

R23 = TransfoMat("r","x",q3);
T23 = TransfoMat("t","z",l3);
H23 = T23*R23;

T34 = TransfoMat("t","x",-l2);
H34 = T34;

T45 = TransfoMat("t","y",q4);
H45 = T45;

T54 = TransfoMat("t","y",l4);
H54 = T54;


M{1} = H01;
M{2} = H12;
M{3} = H23;
M{4} = H34;
M{5} = H45;
M{6} = H54;

DrawRobot(M);



