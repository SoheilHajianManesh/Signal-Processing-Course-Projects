function codedPic=coding(msg,grayPic,mapSet)
    codedPic=grayPic;
    binaryMsg="";
    for i=1:strlength(msg)
        index=find(strcmp(extract(msg,i),mapSet));
        binaryMsg=binaryMsg+string(mapSet(2,((index-1)/2)+1));
    end
    binaryMsg=binaryMsg+string(mapSet(2,32));
    [row col]=size(codedPic);
    pixels=row*col;
    if(pixels<strlength(binaryMsg))
        disp("REACH MAXIMUM CHARACTER");
        return;
    end
    k=1;
    for i=1:col
        for j=1:row
            pixelValue=codedPic(j,i);
            pixelBinary=dec2bin(pixelValue,8);
            pixelBinary(end)=extract(binaryMsg,k);
            codedPic(j,i)=bin2dec(pixelBinary);
            k=k+1;
            if(k>strlength(binaryMsg))
                return;
            end
        end
    end
end