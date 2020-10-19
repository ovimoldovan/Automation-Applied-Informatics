function [ uid ] = PRBS (N,m,a,b)
x0=randi([0 1],m,1);
switch m
    case 3 
        A(1,:)=[1 0 1];
    case 4
        A(1,:)=[1 0 0 1];
    case 5 
        A(1,:)=[0 1 0 0 1];
    case 6
        A(1,:)=[1 0 0 0 0 1];
    case 7
        A(1,:)=[1 0 0 0 0 0 1];
    case 8
        A(1,:)=[1 1 0 0 0 0 1 1];
    case 9
        A(1,:)=[0 0 0 1 0 0 0 0 1];
    case 10
        A(1,:)=[0 0 1 0 0 0 0 0 0 1];
end
A(2:m,1:m-1)=eye(m-1);
for i=1:N
xnew=mod(A*x0,2);
ui=x0(m);
uid(i)=a+(b-a)*ui;
x0=xnew;
end
end

