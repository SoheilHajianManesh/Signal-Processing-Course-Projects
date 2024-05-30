function    codedSignal=coding_freq(msg,bitRate,mapSet)
    binaryMsg=[];
    for i=1:strlength(msg)
        for j=1:size(mapSet,2)
            if(msg(1,i)==mapSet{1,j})
                binaryMsg = [binaryMsg mapSet{2,j}];
            end
        end
    end
    fs=100;
    t = 0:1/fs:0.99;
    codedSignal=[];
    for i=1:bitRate:size(binaryMsg, 2)
        part = binaryMsg(i:i+bitRate-1);
        freq = floor(fs/(2^(bitRate+2))) + floor(bin2dec(part)*(fs/(2^(bitRate+1)))) + 1;
        appendSignal = sin(2*pi*freq*t);
        codedSignal = [codedSignal appendSignal];
    end
end