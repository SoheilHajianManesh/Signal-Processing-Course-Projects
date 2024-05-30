% tested with different x,y and with noise
t=-1:0.001:1;
x1=sin(2*pi*t);
a=7;
B=-2;
noise=randn(size(t));
y1=a*x1+B+noise;
[aEstimate,BEstimate]=p2_4(x1,y1);
aEstimate
BEstimate