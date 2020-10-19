

function dx = lab1(t,x)
global R L C u;
%L = 2000e-3; %putere a lui 10 
%L = 20;
%R = 1e3;
%C = 4.7e-6;
%u = 1;
dx = [-1/L/C * x(2) + 1/L/C * u(t);
    x(1) - 1/R/C * x(2) + 1/R/C * u(t)];
end

