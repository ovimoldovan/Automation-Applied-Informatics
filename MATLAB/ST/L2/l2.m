R = 1e3; L = 2; C = 1e-6;

den_s = [ 1, R/L, 1/L/C];

num1s = [0, 0, 1/L/C];
H(1) = tf(num1s, den_s);
%step(H(1));
%title('Step response for H1');

num2s = [1, 0, 0];
H(2) = tf(num2s, den_s);
%step(H2);
%title('Step response for H2');

num3s = [0, R/L, 0];

%step(H3);
H(3) = tf(num3s, den_s);
%title('Step response for H3');
num4s = [1, 0, 1/L/C];
H(4) = tf(num4s, den_s);
%step(H4);
%title('Step response for H4');

den_p = [1, 1/R/C, 1/L/C];

num1p = [0, 0, 1/L/C];
H(5) = tf(num1p, den_p);

num2p = [1, 0, 0];
H(6) = tf(num2p, den_p);

num3p = [0, 1/R/C, 0];
H(7) = tf(num3p, den_p);

num4p = [1, 0, 1/L/C];
H(8) = tf(num4p, den_p);

%subplot(421);step(H1);title('H1')
%subplot(422);step(H2);title('H2')
%subplot(423);step(H3);title('H3')
%subplot(424);step(H4);title('H4')



%subplot(425);step(H5);title('H5')
%subplot(426);step(H6);title('H6')
%subplot(427);step(H7);title('H7')
%subplot(428);step(H8);title('H8')

for i=1:4
    subplot(4,1,i);step(H(i), H(i+4));title('Step response')
    legend('Series','Parallel')
end
