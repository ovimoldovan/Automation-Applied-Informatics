xa=1:1:6;
ya=1:1:6;
[mX,mY]=meshgrid(xa,ya);
%disp([mX,mY]);
mZ = zeros(6,6);
mZ([1 1 2 1 1 1 2 2 5 5 6 6 5 5 6 6], [1 2 1 2 6 5 5 6 6 5 6 5 2 1 1 2])=10;
%disp(mZ);
%stem3(mX,mY,mZ);
mesh(mX,mY,mZ);