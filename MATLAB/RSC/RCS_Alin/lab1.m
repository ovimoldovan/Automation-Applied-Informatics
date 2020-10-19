%% Ex1
clc;
clear;
P = [1;2;3;1];
Trans_x4 =[1 0 0 4; 0 1 0 0; 0 0 1 0; 0 0 0 1];
P1 = Trans_x4 * P;
P = P1;
Trans_y4 =[1 0 0 0; 0 1 0 -4; 0 0 1 0; 0 0 0 1];
P1 = Trans_y4 * P;
P = P1;
Rot_x90 = [1 0 0 0;0 0 -1 0; 0 1 0 0; 0 0 0 1];
P1 = Rot_x90 * P;
P = P1;
Trans_z4 =[1 0 0 0; 0 1 0 0; 0 0 1 4; 0 0 0 1];
P1 = Trans_z4 * P;
P = P1;
Rot_y90 = [0 0 1 0;0 1 0 0; -1 0 0 0; 0 0 0 1];
P1 = Rot_y90 * P;
P = P1;

%% Ex2
load("C:\Users\alinvoicu26\Desktop\Lab1_matlab\Objects.mat");

Draw_Objects(V1,V2,F1,F2);
Trans = eye(4);
Trans(3,4) = 2; %up 
V1 = Trans*V1;
Draw_Objects(V1,V2,F1,F2);


Trans = eye(4);
Trans(2,4) = 7;

V1 = Trans*V1;
Draw_Objects(V1,V2,F1,F2);
Trans = eye(4);
Trans(1,4) = -8;

V1 = Trans*V1;
Draw_Objects(V1,V2,F1,F2);
Rot_y90 = [0 0 1 0;0 1 0 0; -1 0 0 0; 0 0 0 1];
V1 = Rot_y90 *V1;
Draw_Objects(V1,V2,F1,F2);

Trans = eye(4);
Trans(3,4) = 2;
V1 = Trans*V1;
Draw_Objects(V1,V2,F1,F2);
Trans = eye(4);
Trans(2,4) = -3;

V1 = Trans*V1;
Draw_Objects(V1,V2,F1,F2);











