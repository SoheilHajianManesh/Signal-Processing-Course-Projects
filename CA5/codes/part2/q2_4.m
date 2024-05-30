mapSet=cell(2,32);
mapSet = {'a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','.',',','!',';','"'};
for i=1:32
    mapSet{2,i}=dec2bin(i-1,5);
end
msg='signal';
coded_signal_1=coding_freq(msg,1,mapSet);
coded_signal_5=coding_freq(msg,5,mapSet);
msg_decoded_1=decoding_freq(coded_signal_1,1,mapSet);
msg_decoded_5=decoding_freq(coded_signal_5,5,mapSet);
fprintf("bitRate=1 msg:%s\n",msg_decoded_1);
fprintf("bitRate=5 msg:%s\n",msg_decoded_5);