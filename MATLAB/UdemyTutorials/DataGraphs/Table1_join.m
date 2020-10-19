%table = struct;
child = struct('Name', 'Rose', 'Age', 4, 'ID', 2);
T = struct2table(child);
T.Properties.RowNames={'C1'};

parent = struct('Guardian', 'Alex', 'Phone', '2344', 'ID', 2);

P = struct2table(parent);

R = join(T,P,'Keys','ID');

P
T
R