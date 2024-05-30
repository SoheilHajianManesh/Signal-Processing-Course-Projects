function character=findInMapSet(mapSet,binaryMatrix)
binaryNumber = bin2dec(num2str(binaryMatrix));
binaryNumber = dec2bin(binaryNumber, 5);
    for i=1:32
        if(mapSet{2,i}==binaryNumber)
            character=mapSet{1,i};
            return;
        end
    end
end