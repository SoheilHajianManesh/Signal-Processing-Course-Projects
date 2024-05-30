function corrsOfCrops=corrMatrix(PCBGray,ICGray)
    [PCBrow, PCBcol]=size(PCBGray);
    [ICrow, ICcol]=size(ICGray);
    ICGray = double(ICGray);
    corrsOfCrops=zeros(PCBrow-ICrow+1,PCBcol-ICcol+1);
    for i=1:size(corrsOfCrops,1)
        for j=1:size(corrsOfCrops,2)
            droped=double(PCBGray(i:i+ICrow-1,j:j+ICcol-1));
            corrsOfCrops(i,j)=normalizeCorr(droped,ICGray);
        end
    end  
end