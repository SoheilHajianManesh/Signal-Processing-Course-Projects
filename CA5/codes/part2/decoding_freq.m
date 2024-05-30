function  decodedMsg=decoding_freq(signal,bitRate,mapSet)
    fs=100;
    N=size(signal,2)/5;
    f=0:fs/N:fs/2-fs/N;
    binaryMsg=[];
    for i=1:fs:size(signal,2)
        part = signal(i:i+fs-1);
        fourie_t=fftshift(fft(part));
        [max_value, max_idx] = max(abs(fourie_t));
        max_idx = fs/2 - max_idx + 1;
        for j=1:(2^bitRate)
            if(max_idx < floor(j*fs/(2^(bitRate+1)))+1)
                binaryMsg = [binaryMsg dec2bin(j-1, bitRate)];
                break;
            end
        end
    end
    decodedMsg = [];
    for i=1:5:size(binaryMsg,2)
        for j=1:size(mapSet,2)
            if(binaryMsg(i:i+4)==mapSet{2,j})
                decodedMsg = [decodedMsg mapSet{1,j}];
            end
        end  
    end
end