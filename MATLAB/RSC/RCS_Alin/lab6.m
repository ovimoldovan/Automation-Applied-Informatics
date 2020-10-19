syms qdot s c T
u = [-qdot * s; qdot*c; 0]
U = transpose(u)
Kl = u*U
w = [0;0;qdot];
W = transpose(w);



