fc= 5;
tStart=0;
tEnd=1;
fs=100;
ts=1/fs;
t=tStart:ts:tEnd-ts;
y=cos(2*pi*fc*t);
plot(t,y)
xlabel('time');
ylabel('y');
title("Question 1");