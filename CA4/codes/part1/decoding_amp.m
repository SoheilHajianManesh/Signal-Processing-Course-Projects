function decodeMsg=decoding_amp(signal,speed,mapSet)
    corrs=[];
    x=linspace(0,(size(signal,2)-1)/100,size(signal,2));
    g=sin(2*pi*x);
    for i=1:(size(signal,2)-1)/100
        corr=0;
        for j=100*(i-1)+1:i*100
            corr=corr+signal(j).*g(j);
        end
        corrs=[corrs,corr/100*2];
    end
    corrs=corrs*(2^speed-1);
    corrs=round(corrs);
    binaryMsg = [];
    for i=1:(size(signal,2)-1)/100
        binaryChar = dec2bin(corrs(i),speed);
        binaryMsg = [binaryMsg , binaryChar] ;
    end
    decodeMsg = "";
    for i=1:strlength(binaryMsg)/5
        string = binaryMsg((5*(i-1)+1):5*i);
        index = find(strcmp(mapSet, string));
        number = index/2;
        decodeMsg=decodeMsg+char(mapSet(1,number));
    end
end
