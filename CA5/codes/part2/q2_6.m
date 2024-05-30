mapSet=cell(2,32);
mapSet = {'a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','.',',','!',';','"'};
for i=1:32
    mapSet{2,i}=dec2bin(i-1,5);
end
noiseRate= 1.24;
msg='signal';

[accuracy_1,accuracy_5]=calcAccuracy(mapSet, noiseRate,msg);
fprintf("noise rate = %.2f\n",noiseRate);
fprintf('accuracy bitRate=1: %.2f \n', accuracy_1);
fprintf('accuracy bitRate=5: %.2f \n', accuracy_5);
function [accuracy_1,accuracy_5] = calcAccuracy(mapSet, noiseRate,originalMsg)
    mistakesCount1=0;
    mistakesCount5=0;
    for i=1:100
        coded_signal_5 = coding_freq(originalMsg,5,mapSet);
        noise_signal_5 = noiseRate*randn(size(coded_signal_5));
        coded_signal_5 = coded_signal_5 + noise_signal_5;
        coded_signal_1 = coding_freq(originalMsg,1,mapSet);
        noise_signal_1 = noiseRate*randn(size(coded_signal_1));
        coded_signal_1 = coded_signal_1 + noise_signal_1;
        msg_decoded_5 = decoding_freq(coded_signal_5, 5,mapSet);
        msg_decoded_1 = decoding_freq(coded_signal_1,1,mapSet);
        if(~strcmp(msg_decoded_5, originalMsg))
            mistakesCount5 = mistakesCount5 + 1;
        end
        if(~strcmp(msg_decoded_1, originalMsg))
            mistakesCount1 = mistakesCount1 + 1;
        end
    end
    accuracy_1=(100-mistakesCount1)/100;
    accuracy_5=(100-mistakesCount5)/100;    
end