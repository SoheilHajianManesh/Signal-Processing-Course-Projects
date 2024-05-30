[x,ferq]=audioread('soheil.wav');
plot(x);
xlabel('1/48000s');%ferquency=48000
%sound(x, ferq);

audiowrite('x.wav',x,ferq);


