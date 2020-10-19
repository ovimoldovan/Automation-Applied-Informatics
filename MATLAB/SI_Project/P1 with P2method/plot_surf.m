function [  ] = plot_surf( X1,X2,f,Y )

hold on;
surf(X1,X2,f,'EdgeColor','b');
xlabel('X1');ylabel('X2');zlabel('Y');
surf(X1,X2,Y,'EdgeColor','r');

hold off;

end

