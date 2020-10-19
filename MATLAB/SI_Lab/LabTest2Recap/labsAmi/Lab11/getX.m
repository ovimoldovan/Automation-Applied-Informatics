function [ x ] = getX( C,d,u, theta)
N = length(u);
phi1 =[];
phi2 =[];
phi = [];
nc = length(C) - 1;
nd = length(D) - 1;
 for k=1:N
     for i=1:nc
         if k-i>0
            phi =[phi -x(k-i)];
         else
             phi = [phi 0];
         end
     end
     for i=1:nd
         if k-i>0
             phi = [phi u(k-i)];
         else
             phi = [phi 0];
         end
     end
    x(k) = phi * theta;
 end
end

