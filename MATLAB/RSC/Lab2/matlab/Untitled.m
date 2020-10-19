%%
q1=0;
q2=0;
q3=0;
q4=0;
q5=0;
q6=0;
l=1;

M=[0 0 13 q1; 0 pi/2 0 q2; 8 0 0 q3; 8 0 0 q4; 0 pi/2 0 q5; 0 pi/2 l q6];
%%
L1 = Link( 'd' , 13, 'a' , 0, 'alpha' , 0, 'modified');
L2 = Link( 'd' , 0, 'a' , 0, 'alpha' , pi/2, 'modified');
L3 = Link( 'd' , 0, 'a' , 8, 'alpha' , 0, 'modified');
L4 = Link( 'd' , 0, 'a' , 8, 'alpha' , 0, 'modified');
L5 = Link( 'd' , 0, 'a' , 0, 'alpha' , pi/2, 'modified');
L6 = Link( 'd' , 2, 'a' , 0, 'alpha' , pi/2, 'modified');

bot = SerialLink([L1 L2 L3 L4 L5 L6] , 'name' , 'robocop');
