format long
noise=randn(1,3000);
histogram(noise)
%calc average
sum=0;
for i=1:3000
    sum=sum+noise(i);
end
average=sum/3000;
average
calc variance
sumPow = 0;
for i=1:3000
    sumPow = sumPow + (noise(i)-average)^2;
end
var = sumPow/3000;
var