X = [84 76 54 90 52 73 11 80 62 58];
Y = sort(X); %ascending by default
Y1 = sort(X, 'descend');
Y3 = max(X);
Y4 = min(X);
Y5 = mean(X);
Y6=median(X); %media a 2 elem din mijloc, sortate
Y7 = std(X); %standard deviation
Y8 = Y7^2; %square of std = variance

%graph

% bar([7 3 5 9]); %bargraph

bat = [75 144 114 102 108; 90 126 102 84 126; 96 114 75 105 136];

% bar([1992 1993 1994], bat, 'group');


%data4

p = [10 20 10 25 20 15];
sum(p); %sum = 100
%pie(p);
pie3(p);

%if the sum is not 100 it will do the math itself

