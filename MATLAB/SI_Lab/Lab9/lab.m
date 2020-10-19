clear all;
load('lab8_3.mat');
eps(1) = 0;
%eps = zeros(150);
uid = id.u;
yid = id.y;
Ts = id.Ts;
f = 1;
b = 1;
N = length(uid);

thetad = [f;b];



ycap=zeros(N);

%for i=2:N+1
%    ycap(i-1) = ycap(f,b,eps,uid(i-1),yid(i-1))
%end

dV = 0;
H = 0;

l = 1;

alpha = 0.001;
%thetaNew = thetad;

lmax = 500;

delta = 0.1;

     for i=2:N
        eps(i) = -f*eps(i-1) + yid(i) - b * uid(i-1) + f*yid(i-1);
        epsF(i) = -eps(i-1) + yid(i-1);
        epsB(i) = -uid(i-1);
     end
     
     dV = 0;
     H = 0;

     
     for i=1:N
        thetad2 = [epsF(i);epsB(i)];
        dV = dV + 2/N * eps(i).* thetad2;
        H = H + 2/N * thetad2* thetad2';
     end
    thetaNew = thetad - alpha* inv(H)*dV;
    l=l+1;

while l<lmax && norm(thetaNew-thetad) > delta;
    thetad=thetaNew;
dV = 0;
        H = 0;
    for i=2:N
        eps(i) = -f*eps(i-1) + yid(i) - b * uid(i-1) + f*yid(i-1);
        epsF(i) = -eps(i-1) + yid(i-1);
        epsB(i) = -uid(i-1);
        
        
        thetad2 = [epsF(i);epsB(i)];
        dV = dV + 2/N * eps(i).* thetad2;
        H = H + 2/N * thetad2* thetad2';
       
    end
    thetaNew = thetad - alpha * inv(H)*dV;
    l=l+1;
    
    f = thetaNew(1);b = thetaNew(2);
    
    
end
model = idpoly(1,[0, thetaNew(2)], 1, 1, [1, thetaNew(1)], 0, Ts);
compare(model,val)


