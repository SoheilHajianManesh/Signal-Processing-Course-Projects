function cleanPic=myremovecom(picture,n)
    [row,column]=find(picture==1);
    points=[row';column'];
    objNumber=1;  
    while size(points,2)>0
        startPoint=points(:,1);  
        points(:,1)=[];
        [points,adjPoints]=findAdjencyPoints(startPoint,points);
        currentObject=[startPoint adjPoints];
        while size(adjPoints,2)>0
            newAdjs=[];
            for i=1:size(adjPoints,2)
                [points,newpoints]=findAdjencyPoints(adjPoints(:,i),points);
                newAdjs=[newAdjs newpoints];
            end
            currentObject=[currentObject newAdjs];
            adjPoints=newAdjs;
        end
        objects{objNumber}=currentObject;
        objNumber=objNumber+1;
    end
    for i=1:objNumber-1
        if(size(objects{i},2)<n)
            index=sub2ind(size(picture),objects{i}(1,:),objects{i}(2,:))
            picture(index)=0;
        end
    end
    cleanPic=picture;
end