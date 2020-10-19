l1 = 0.5;
l2 = 0.2;
l3 = 0.2;
L1 = Link('a', 0, 'alpha', pi/2, 'theta', pi/2, 'modified');
L2 = Link('d', 0, 'a', l1, 'alpha', 0, 'modified');
L3 = Link('d', 0, 'a', l2, 'alpha', 0, 'modified');


bot = SerialLink( [ L1 L2 L3] , 'name' , 'robocop' );
bot.tool=transl(l3, 0, 0);

T1 = transl(0.1414, -0.3, 0.8414)*troty(-pi/2);
T2 = transl(0.4, 0.2, 0.5)*troty(pi);

T = ctraj(T1, T2, 50);
q0=[0, 0.2, 0.3];
M=[1 1 1 0 0 0];

q=bot.ikine(T, q0, M);

bot.plot(q, 'workspace', [-1, 1, -1, 1, -1, 1]);