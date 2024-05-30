function decodeMsg=decoding(codedPic,mapSet)
    decodeMsg="";
    [row col]=size(codedPic);
    k=1;
    pocket=zeros(1,5);
    for i=1:col
        for j=1:row
            pixelValue=codedPic(j,i);
            pixelBinary=dec2bin(pixelValue,8);
            pocket(1,k)=bin2dec(pixelBinary(end));            
            k=k+1;
            if(k==6)
                if(pocket==[1,1,1,1,1])
                    return;
                end
                k=1;
                c=findInMapSet(mapSet,pocket);
                decodeMsg=decodeMsg+c;
            end
        end
    end
end