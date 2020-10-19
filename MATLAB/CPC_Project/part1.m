%Reglarea automata a nivelului
%Dezoltarea unui model neliniar al procesului

clc; clear;
A = 332.5; %[cm^2], suprafata bazinului

% Coeficienti model pompa(determinate experimental):
k = 0.035;
k1 = 0.654; %6.24
k2 = -0.015;
k3 = -0.0006;

C = 9; %Coeficientul de curgere

%Amplifier ->INPUT: uc [0-10V], OUTPUT: um, [0,22V]

% Motor:
% um = Rm*im+em;m=mr;em=km*n;m=km*im;
%Rm = rezistenta infasurarii rotorice a motorului;
%im = curentul absorbit de motor;
%em = tensiunea contraelectromotoare dezvoltata de motor;
%m = cuplul activ dezvoltat de motor
%mr = cuplul rezistent
%kmn * n = em = um - Rm*im; 
Rm = 3; %[ohm]
%pentru a evita determinarea constantei de proportionalitate km se va
%considera ca iesirea motorului nu este direct turatia n ci km*n


%Pompa: Input: turatia km*n; Output: debitul de intrare in rezervorul
%principal qi
h = 0.17; %17cm

k11 = k2^2+4*(k-k3)*k1;
k12 = 8*(k-k3);
k13 = 2*(k-k3);

% TRADUCTOR : 3cm/V

%RANDAMENT
keta = 8e-5;