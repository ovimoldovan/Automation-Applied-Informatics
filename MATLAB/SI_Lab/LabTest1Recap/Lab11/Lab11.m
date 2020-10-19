clear all;
load('lab11cl_1.mat');

na=2; nb=2;  % second order, it's written in the lab!!
rid=rid';
model=iv_comp(id,na,nb,rid);

model2=arx(id,[na,nb,1]);
C=model2.A;
D=model2.B;

modeliv = iv(id, [na, nb, 1], C, D); % it should be like this because the input is not correlated with the error but the iv funcion uses feedback so it actually is correlated, that's the point of seeing which iv we should use

compare(model,val)
figure()
compare(modeliv,val);

%% part 2
clear all;
load('lab11mv_1.mat');
na=3;
nb=3;
mARX = arx(id, [na, nb, 1]); 
resid(mARX, id);

mOE = oe(id, [na, nb, 1]); 
resid(mOE, id);

%the graph goes from -20 to 20 (and is not all pos) because is normalized,
