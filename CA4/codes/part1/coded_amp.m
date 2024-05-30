function    codedMsgSignal=coding_amp(msg,speed,mapSet)
    binaryMsg="";
    for i=1:strlength(msg)
        index=find(strcmp(extract(msg,i),mapSet));
        binaryMsg=binaryMsg+string(mapSet(2,((index-1)/2)+1));
    end
    codedMsgSignal=[];
    coeficients=linspace(0,0.99,2^speed);
    for i=1:speed:strlength(binaryMsg)
        splitMsg="";
        for j=0:speed-1
            splitMsg=splitMsg+extract(binaryMsg,i+j);
        end
        for t=0:0.01:0.99
            codedMsgSignal=[codedMsgSignal,coeficients(bin2dec(splitMsg)+1)*sin(2*pi*t)];
        end
    end
    codedMsgSignal=[codedMsgSignal,0];
end