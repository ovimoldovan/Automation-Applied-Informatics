%generare semnal periodic x
T0 = 1; w0 = 2*pi/T0;
Ts = 0.0005; t = -1:Ts:2;
x = t-0.1-round(t);
plot(t,x)

%analiza semnalului x
nc = 17;
ak = fsAnalysis(x,t,T0,Ts,nc);

%sinteza semnalului utilizand forma alternativa a seriei Fourier
Xm0 = ak(ceil(nc/2));
ksi0 = 0;
Xm = abs(ak(ceil(nc/2)+1:nc));
ksi = angle(ak(ceil(nc/2)+1:nc));
nmax = floor(nc/2);
y = Xm0 * ones(size(t));
for k = 1:nmax
    y = y+2*Xm(k) * cos(w0*k*t + ksi(k));
end
figure; plot(t,x,'r',t,y,'b')
xlabel('t'); legend('x(t)', 'Fourier series');

%afisare de spectru 
n = 1:nmax;
n0 = [0, n];
figure, subplot(3,1,1);
stem(n0, [Xm0, Xm], '.')
legend('amplitude spectrum')
subplot(3,1,2)
stem(n0,[ksi0, ksi], '.g')
legend('phase spectrum')
subplot(3,1,3)
stem(n0, [Xm0^2, (Xm.^2)/2], '.r')
xlabel('n')
legend('power spectrum')