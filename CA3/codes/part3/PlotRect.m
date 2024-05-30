function PlotRect(PCBImage,rowIndices,colIndices,ICGray)
    [ICrow, ICcol]=size(ICGray);
    imshow(PCBImage);
    title('Matching Resault')
    hold on;
    for i=1:size(rowIndices,1)
        rectangle('Position',[colIndices(i,1) rowIndices(i,1) ICcol ICrow],'EdgeColor','b');
    end
end