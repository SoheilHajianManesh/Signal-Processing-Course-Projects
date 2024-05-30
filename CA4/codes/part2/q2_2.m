ts=1e-9;
T=1e-5;
tau=1e-6;
t=0:ts:T;
R=450;
c=3e8;
idx=round(tau/ts);
td=2*R/c;


upSignal=zeros(size(t));
upSignal(1:round(tau/ts))=1;
hold on;
plot(t,upSignal,'r');


backSignal=zeros(size(t));
backSignal(round(td/ts):round(td/ts)+idx)=0.5;
hold on ;
plot(t,backSignal,'b');


z = conv(upSignal,backSignal);
hold on;
plot(z);
title('Convolution');
[val2,pos2]=max(z);
td2 = round((pos2-1000))*ts;
R2 = round(c*td2/2);
fprintf("Distance between sent and recive signal :%d",R2);