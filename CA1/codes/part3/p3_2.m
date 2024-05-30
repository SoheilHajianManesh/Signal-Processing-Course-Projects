ts=1e-9;
T=1e-5;
tau=1e-6;
t=0:ts:T;
idx=round(tau/ts);
upSignal=zeros(size(t));
upSignal(1:round(tau/ts))=1;
figure ;
plot(t,upSignal,'r');
ylim([-3,3]);
grid on;


td=2*450/3e8;
backSignal=zeros(size(t));
backSignal(round(td/ts):round(td/ts)+idx)=1;
hold on ;
plot(t,backSignal,'b');
title('Sent And Recive Signals');

