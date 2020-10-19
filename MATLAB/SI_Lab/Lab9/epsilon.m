function [ eps ] = epsilon( x,y,u,f,b )

eps = -epsilon(x + y - b*u + f*y);

end

