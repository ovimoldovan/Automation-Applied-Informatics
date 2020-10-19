%% images
clear; close all
img = imread('peppers.png');
if(ndims(img)==3) img = rgb2gray(img);end

F = fftshift(fft2(double(img)));
figure; imshow(img);
figure; imshow(log(abs(F)),[]);title('Magnitude')
figure; imshow(angle(F));title('Phase')
%filtertype = 'LPF';
filtertype = 'BLPF';
%filtertype = 'GLPF';
%filtertype = 'HPF';
%filtertype = 'BHPF';
%filtertype = 'GHPF';
D0 = 27;
n = 1; %order for Butterworth filter
[M, N] = size(img);
H = imfreqfilter(filtertype, M, N, D0, n);
figure; surf(H), title(filtertype);
G = H.*F;
figure; imshow(log(abs(G)), []); title('Filtered magnitude')
figure; imshow(angle(G), []); title('Filtered phase')
imgf = real(ifft2(ifftshift(double(G))));
figure, imshow(imgf, []); title('Filtered image')


%% sound
%disp((2/N)*real(fft(x)))
%disp((-2/N)*imag(fft(x)))
load train
figure, plot([0:length(y) - 1]/Fs, y), xlabel('t'), ylabel('x(t)'), title('Semnal tren')
%sound(y)
N = 2000; n = [0:N-1]; x = y(8000+n);
figure, subplot(311), t = [0:N-1]/Fs; plot(t,x), axis([0 0.03 -1 1])
subplot(312), Xf = fft(x); plot(abs(Xf) * 2/N), ylabel('Spectrul semnalului x')
%3 varfuri in spectru la indicii Matlab 173 217 286

k1 = [173 217 286]
disp(abs(Xf(k1))*2/N)

%amplitudini rezultate(ck): 0.14 0.23 0.42
disp(angle(Xf(k1)))
%faze rezultate in radiani: 1.75 -1.49 -0.66

disp((k1 - 1) / N * Fs) 

%frecvente rezultate (Hz): 705 885 1167

%prin urmare o aproximare cu 3 termeni in serie Fourier este x(t) = z(t)
%unde z(t) = 0.14cos(2pi705t + 1.75) + 0.23...
z = 0.14*cos(2*pi*705*t + 1.75) ...
    + 0.23 * cos(2*pi*885*t - 1.49) ...
    + 0.42*cos(2*pi*1167*t - 0.66);
subplot(311), hold on, plot(t,z, 'g--'),
subplot(313), Zf = fft(x); plot(abs(Zf)*2/N), ylabel('Spectrul semnalului z')
