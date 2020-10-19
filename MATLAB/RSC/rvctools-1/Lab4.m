%%
l3=0.2;

L1 = Link( 'a' , 0, 'alpha' , 0, 'theta', 0, 'modified');
L2 = Link( 'd' , 0.5, 'a' , 0, 'alpha' , -pi/2, 'modified');
L3 = Link( 'd' , 0, 'a' , 0.2, 'alpha' , 0, 'modified');
L4 = Link( 'd' , 0.2, 'a' , 0, 'alpha' , 0, 'modified');

bot = SerialLink([L1 L2 L3 L4] , 'name' , 'robocop');
q=[0,0,0,0];
bot. fkine ([0.1 0.2 0.1 0.2]);
bot.plot(q, 'workspace',[-1, 1, -1, 1, -1, 1]);
%%
clc;
bot.tool=transl(l3, 0, 0);
T1 = transl(0.1414, -0.3, 0.8414)*trotx(-pi/2);
T2 = transl(0.4, 0.2, 0.5)*trotx(pi);

T = ctraj(T1, T2, 50);
q0=[0, 0, 0, 0];
M=[1 1 1 0 0 0];

q=bot.ikine(T, q0, M);

bot.plot(q, 'workspace', [-1, 1, -1, 1, -1, 1]);
