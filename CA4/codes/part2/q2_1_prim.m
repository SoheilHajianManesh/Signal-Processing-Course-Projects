ts=1e-9;
T=1e-5;
tau=1e-6;
t=0:ts:T;
R=450;
c=3e8;
idx=round(tau/ts);
td=2*R/c;

backSignal=zeros(size(t));
backSignal(round(td/ts):round(td/ts)+idx)=1;
hold on;
plot(t,backSignal,'b');

[R, corrolationValues] = calcInputSignal(backSignal);
figure
plot(t,corrolationValues,'g');
grid on;
fprintf('Distance between sent signal and recive signal : %d',R);


function [R,corrolationValues]=calcInputSignal(backSignal)
    ts=1e-9;
    T=1e-5;
    tau=1e-6;
    t=0:ts:T;
    idx=round(tau/ts);

    corrolationValues=zeros(size(t));
    for i=1:round(T/ts)-idx
        sampleSignal=zeros(size(t));
        sampleSignal(i:i+idx-1)=1;
        corrolationValues(i)=sampleSignal*(backSignal');
    end
    [MaxCorrolation,maxPosition]=max(corrolationValues);
    Td=t(maxPosition);
    R=round(Td*3e8/2);
end