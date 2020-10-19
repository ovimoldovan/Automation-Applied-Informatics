H = tf(4.3, conv([5 1],[23 1]), "InputDelay", 2.5);
Ts = 2.5/4;
Hz = c2d(H, Ts, 'zoh')
[n,d] = tfdata(Hz, 'v')
Hzz = tf(n,d,Ts,'Variable','z^-1', 'InputDelay', 2.5/Ts)

n1 = [0 0 0 0 n];
Hzzz = filt(n1,d,Ts);

coef = sum(n)

k = 1/coef

[B,A] = tfdata(Hzzz, 'v');
B = B.*k;
A = A.*k;

Hk = filt(B,A,Ts);

[P,Q] = tfdata(Hk,'v');
P(1) = -1;

HR = filt(Q, [-P], Ts)

zpk(HR)

%syms z
%format long

%(1-z^-1) *1.707 * (1 + 1.096*z^-1 + 0.7342*z^-2) * (1 - 0.8031*z^-1 + 0.9389*z^-2)



