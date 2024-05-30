function [R,corrolationValues]=p3_3(backSignal)
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
    R=Td*3e8/2;
end