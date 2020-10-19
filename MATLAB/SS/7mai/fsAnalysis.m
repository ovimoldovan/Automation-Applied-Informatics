function ak = fsAnalysis(x,t,T0,Ts,nc)
    %estimeaza coeficientii seriei Fourier ak pentru semnalul periodic x
    %T0 este perioada semnalului x; Ts este perioada de esantionare
    %nc reprezinta numarul de coeficienti
    w0 = 2*pi/T0;
    
    %se extrage o perioada din semnal
    t = t(1:floor(T0/Ts));
    x = x(1:length(t));
    figure;plot(t,x(1:length(t))); xlabel('t'); ylabel('y(t)'); grid
    
    %se estimeaza coeficientii ak
    k = -floor(nc/2);
    for i = 1:nc
        ak(i) = (1/T0)*trapz(t,x .*exp(-j*k*w0*t));
        k = k+1;
    end
end

