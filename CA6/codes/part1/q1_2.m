fc= 5;
tStart=0;
tEnd=1;
fs=100;
ts=1/fs;
t=tStart:ts:tEnd-ts;

V=50;
R=250000;
beta=0.3;
alpha=0.5;
fd=beta*V;
C=3e8;
td=2*R/C;

y=cos(2*pi*fc*t);
responseSignal=alpha*cos(2*pi*(fc+fd)*(t-td));
plot(t, y);
ylim([-2 2]);
hold on    ;             
plot(t, responseSignal);
hold off;
xlabel('time');
ylabel('y');
title('Question 2');
legend('Original Signal', 'Response Signal');
