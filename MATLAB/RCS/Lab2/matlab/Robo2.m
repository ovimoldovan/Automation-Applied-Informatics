%% b
clear M1;
q1=0; %degrees
q2=0; %degrees
q3=0; %degrees
q4=1; %length

l1=3;
l2=1;
l3=2;
l4=2;

M1{1}=[cos(q1) -sin(q1) 0 0; sin(q1) cos(q1) 0 0; 0 0 1 l1; 0 0 0 1];
M1{2}=[1 0 0 l2; 0 cos(q2) -sin(q2) 0; 0 sin(q2) cos(q2) 0; 0 0 0 1];
M1{3}=[1 0 0 0; 0 cos(q3) -sin(q2) 0; 0 sin(q2) cos(q2) l3; 0 0 0 1];
M1{4}=[1 0 0 -l2; 0 cos(q2) -sin(q2) 0; 0 sin(q2) cos(q2) 0; 0 0 0 1];
M1{5}=[1 0 0 0; 0 1 0 q4; 0 0 1 0; 0 0 0 1];
M1{6}=[1 0 0 0; 0 1 0 l4; 0 0 1 0; 0 0 0 1];
DrawRobot(M1);
%% c
clear M2;
q1=0; %degrees
q2=-pi/20; %degrees
q3=pi/20; %degrees
q4=10; %length

l1=30;
l2=10;
l3=20;
l4=20;

M2{1}=[cos(q1) -sin(q1) 0 0; sin(q1) cos(q1) 0 0; 0 0 1 l1; 0 0 0 1];
M2{2}=[1 0 0 l2; 0 cos(q2) -sin(q2) 0; 0 sin(q2) cos(q2) 0; 0 0 0 1];
M2{3}=[1 0 0 0; 0 cos(q3) -sin(q2) 0; 0 sin(q2) cos(q2) l3; 0 0 0 1];
M2{4}=[1 0 0 -l2; 0 cos(q2) -sin(q2) 0; 0 sin(q2) cos(q2) 0; 0 0 0 1];
M2{5}=[1 0 0 0; 0 1 0 q4; 0 0 1 0; 0 0 0 1];
M2{6}=[1 0 0 0; 0 1 0 l4; 0 0 1 0; 0 0 0 1];
DrawRobot(M2);