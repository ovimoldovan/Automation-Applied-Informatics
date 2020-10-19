%s = re + j*im;

%% 

Te = 0.1; %sampling period
re = 0;
im = linspace(0,pi/Te,100); % 0:pi/Te, 100 valori
s = re + j*im;
subplot(1,2,1);plot(s, '^g-');title('s Plane');hold on;
subplot(1,2,2);plot(exp(s*Te), '^g-');title('z Plane');
hold on;


%%

re = linspace(0, -50, 100);
im = pi/Te;
s = re + j*im;
subplot(1,2,1);plot(s, '^r-');title('s Plane');
subplot(1,2,2);plot(exp(s*Te), '^r-');title('z Plane');



%% 
re = -50;
im = linspace(pi/Te,-pi/Te,100);

s = re + j*im;
subplot(1,2,1);plot(s, '^b-');title('s Plane');
subplot(1,2,2);plot(exp(s*Te), '^b-');title('z Plane');

%%
re = linspace(-50,0,100);
im = -pi/Te;
s = re + j*im;
subplot(1,2,1);plot(s, '<y-');title('s Plane');
subplot(1,2,2);plot(exp(s*Te), '<y-');title('z Plane');

%%
re = 0;
im = linspace(-pi/Te,0,100);
s = re + j*im;
subplot(1,2,1);plot(s, '^m-');title('s Plane');
subplot(1,2,2);plot(exp(s*Te), '^m-');title('z Plane');

