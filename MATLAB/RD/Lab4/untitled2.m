clc;
clear;
load("failures_2.mat")

%%

nc = sum(c);
np = sum(p);
nm = sum(m);
ns = sum(s);
Pc = 100;
Pp = 50;
Ps = 10;
Pm = 1;

N = 40;
D = (nc*Pc + np*Pp + ns*Ps + nm*Pm)/40;