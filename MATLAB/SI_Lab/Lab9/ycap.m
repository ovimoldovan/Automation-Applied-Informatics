function [ ynew ] = ycap( f,b,e,u,y )

ynew = -f * y + b * u + e;

end

