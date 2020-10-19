D = csvread('stock.csv'); %comma separated variable
disp(D);
disp(D(:,1));

T1 = table(D(:,1), D(:,2), D(:,3), D(:,4),...
    'VariableNames', {'High','Low','Close','Volume'});

T1

%exista si table2struct