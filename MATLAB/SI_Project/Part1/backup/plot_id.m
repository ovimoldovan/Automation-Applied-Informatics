function [  ] = plot_id( X1,X2,fid,Y )

hold on;
surf(X1,X2,fid,'EdgeColor','b');
surf(X1,X2,Y,'EdgeColor','r');
hold off;

end

