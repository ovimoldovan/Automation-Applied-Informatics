%% first order element - 
%the circuit parameters
R1 = 1e3; R2 = 1e3; C1 = 1e-6;
%the transfer function parameters
k = R1/R2; %gain factor
T = R2 * C1; %time constant
%declare the transfer function
H = tf(k, [T,1]);
step(H);