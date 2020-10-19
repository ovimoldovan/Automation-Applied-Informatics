function [  ] = plot_surf( X1,X2,f,Y )

hold on;
surf(X1,X2,f,'EdgeColor','b');
surf(X1,X2,Y,'EdgeColor','r');
hold off;

end

