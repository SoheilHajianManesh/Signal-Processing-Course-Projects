% PART A
t_start=-1;
t_end=1;
fs=50;
ts=1/fs;
t=t_start:ts:t_end-ts;
x=cos(10*pi*t);
subplot(2,1,1);
plot(t,x);
xlabel("Time(s)");
ylabel("cos(10pi*t)");
xlim([-1 1]);
title("countinous signal");
% PART B
N=length(t);
fourier_fs=-fs/2:fs/N:fs/2-fs/N;
y=fftshift(fft(x));
subplot(2,1,2);
plot(fourier_fs,abs(y)/max(abs(y)));
xlabel("Frequency(Hz)");
ylabel("amplitude");
title("signal amplitude in fourier");