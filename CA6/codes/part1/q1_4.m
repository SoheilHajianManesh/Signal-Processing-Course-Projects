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

noiseRate= 1.1;

responseSignal=alpha*cos(2*pi*(fc+fd)*(t-td));

noiseSignal = noiseRate*randn(size(responseSignal));

responseSignal=responseSignal+noiseSignal;

[R_,V_]=calculateR_V(responseSignal,fc);

fprintf("Noise Rate : %f\n",noiseRate);
fprintf('   R vs R_: %d vs %d m\n',R, R_);
fprintf('   V vs V_: %d vs %d m/s\n', V,V_);