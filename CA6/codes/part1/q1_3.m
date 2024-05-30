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

responseSignal=alpha*cos(2*pi*(fc+fd)*(t-td));

[R_,V_]=calculateR_V(responseSignal,fc);

fprintf('actual R vs calculated R: %d vs %d m\n',R, R_);
fprintf('actual V vs calculated V: %d vs %d m/s\n', V,V_);