%help audiorecorder
Fs = 22050; %sample rate
r = audiorecorder(Fs, 16, 1);
record(r)
pause(10)
stop(r)
y = getaudiodata(r, 'double');

%% 
sound(y,Fs)

%% 
load handel
sound(y,Fs*3)
sound(y,Fs*3)
sound(y,Fs*3)
sound(y,Fs*3)
sound(y,Fs*5)
sound(y,Fs*5)
sound(y,Fs*5)
sound(y,Fs*5)

%% 
plot(y)
%% spectrul
f1 = 10; f2 = 40;
Te = 1/f1/100;Fs=1/Te;
t = 0:Te:7/f1;
s = sin(2*pi*f1*t) + 3 * sin(2*pi*f2*t)
ffts = fft(s); % fast fourier transform
l = length(ffts);
f = Fs * (1:l)/l;
bar(f, abs(ffts)/l*2);
ylabel('Amplitude');xlabel('Frequency');xlim([0,70])
sound(s,Fs) %% nu se aude nimic

%% 
load handel
plot(y);
%spectrul lui y
ffty = fft(y);
l = length(ffty);
f = Fs * (1:l)/l;
bar(f, abs(ffty)/l*2)
xlabel('Frequency');

%% filtru 
f1 = 500; w1 = 2*pi*f1;
f2 = 850; w2 = 2*pi*f2;
H = tf([1,0,0]/w1^2, conv([1/w2^2, 1/w2, 1], [1/w2^2, 1/w2, 1]))
bode(H)
%%
Hd = c2d(H,1/Fs, 'tustin')
bode(H,Hd); shg

%% semnal filtrat
yd = lsim(Hd,y)
plot(y,'b'); hold; plot(yd,'r');
hold; legend('initial', 'filtrat');

fftyd = fft(yd);
bar(f, abs(fftyd)/l*2,'b');hold;
bar(f, abs(ffty)/l*2,'r')
