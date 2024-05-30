ts=1e-9;
T=1e-5;
tau=1e-6;
t=0:ts:T;
idx=round(tau/ts);
td=2*450/3e8;
backSignal=zeros(size(t));
backSignal(round(td/ts):round(td/ts)+idx)=1;


[R, corrolationValues] = p3_3(backSignal);
figure
plot(t,corrolationValues,'g');
grid on;
fprintf('funtion p3_3 R : %d',R);