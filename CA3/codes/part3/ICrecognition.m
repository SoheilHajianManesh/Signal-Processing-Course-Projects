function ICrecognition(PCBImage,ICImage)
    PCBGray=rgb2gray(PCBImage);
    ICGray=rgb2gray(ICImage);
    corrMatrix1=corrMatrix(PCBGray,ICGray);
    corrMatrix2=corrMatrix(PCBGray,imrotate(ICGray,180));
    [rowIndexes1, colIndices1] = find(corrMatrix1 >= 0.93);
    [rowIndexes2, colIndices2] = find(corrMatrix2 >= 0.93);
    rowIndexes=vertcat(rowIndexes1,rowIndexes2);
    colIndices=vertcat(colIndices1,colIndices2);
    PlotRect(PCBImage,rowIndexes,colIndices,ICGray);
end