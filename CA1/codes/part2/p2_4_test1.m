% tested with p2.mat file
load p2.mat
[a, B]=p2_4(x,y);
x0=-1:0.001:1;
y0=a*x0+B;

figure
plot(x0,y0,'g','lineWidth',3)
hold on
plot(x,y,'.')
grid on
a
B