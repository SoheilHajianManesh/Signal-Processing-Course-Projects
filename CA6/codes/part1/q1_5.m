fc=5;
tStart=0;
tEnd=1;
fs=100;
ts=1/fs;
t=tStart:ts:tEnd-ts;

beta = 0.3; 
C = 3e8; 

R1 = 250000; 
V1 = 50;     
alpha1 = 0.5; 

R2 = 200000;
V2 = 60;     
alpha2 = 0.6;    

fd1 = beta * V1;
td1 = 2 * R1 / C;
fd2 = beta * V2;
td2 = 2 * R2 / C;

y1 = alpha1 * cos(2 * pi * (fc+fd1) * (t - td1));
y2 = alpha2 * cos(2 * pi * (fc+fd2) * (t - td2));

y = y1 + y2;

figure;
plot(t, y);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Received Signal from Two Objects');
grid on;