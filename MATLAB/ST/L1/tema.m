function tema(R,L,C,t,u)
global R L C u t

t1 = [t(1), t(length(t))];
[t2,y] = ode23(@lab1, t1, [0, 0]);
%plot(t,u,'color','r'); 
plot(t2, y(:,2),'color','b'); shg
end
