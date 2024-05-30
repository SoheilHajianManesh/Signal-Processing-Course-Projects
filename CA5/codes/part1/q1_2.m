% PART A
t_start=0;
t_end=1;
fs=100;
ts=1/fs;
t=t_start:ts:t_end-ts;
x=cos(30*pi*t+pi/4);
subplot(3,1,1);
plot(t,x);
xlabel("Time(s)");
ylabel("cos(30pi*t+pi/4)");
xlim([0 1]);
title("countinous signal");
% PART B
N=length(t);
fourier_fs=-fs/2:fs/N:fs/2-fs/N;
y=fftshift(fft(x));
subplot(3,1,2);
plot(fourier_fs,abs(y)/max(abs(y)));
xlabel("Frequency(Hz)");
ylabel("amplitude");
title("signal amplitude in fourier");
% PART C
tol=1e-6;
y(abs(y)<tol)=0;
theta=angle(y);
subplot(3,1,3);
plot(fourier_fs,theta/pi);
xlabel("Frequency(Hz)");
ylabel("Phase/\pi");
title("signal angle in fourier");