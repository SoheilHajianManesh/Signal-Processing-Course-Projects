mapSet=cell(2,32);
mapSet = {'a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','.',',','!',';','"'};
for i=1:32
    mapSet{2,i}=dec2bin(i-1,5);
end
noiseRate= 100;
msg='signal';
coded_signal_1=coding_freq(msg,1,mapSet);
coded_signal_5=coding_freq(msg,5,mapSet);

noise_signal_1=coded_signal_1+noiseRate*randn(size(coded_signal_1));
noise_signal_5=coded_signal_5+noiseRate*randn(size(coded_signal_5));

msg_decoded_1 = decoding_freq(coded_signal_1, 1, mapSet);
msg_decoded_5 = decoding_freq(coded_signal_5, 5, mapSet);

x_1=linspace(0,5*strlength(msg)/1,5*strlength(msg)/1*100);
x_5=linspace(0,5*strlength(msg)/5,5*strlength(msg)/5*100);

% plot(x_1,noise_signal_1);
% title("bit rate=1");
plot(x_5,noise_signal_5);
title("bit rate=5");


fprintf("noise rate = %.2f\n",noiseRate);
fprintf('decoded msg bitRate=1: %s \n', msg_decoded_1);
fprintf('decoded msg bitRate=5: %s \n', msg_decoded_5);