function [M1] = cM3v(M)

N=length(M);
M1=[];

for i=1:N
    Mv=M(i).v;
    M1=horzcat(M1,Mv);
end

end