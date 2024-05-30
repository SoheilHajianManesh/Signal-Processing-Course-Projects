function [points,adjencyPoints]=findAdjencyPoints(startPoint,points)

pointsNum=size(points,2);
diff= abs(repmat(startPoint,1,pointsNum)-points);
index=find(diff(1,:)<=1 & diff(2,:)<=1);
adjencyPoints=points(:,index);
points(:,index)=[];
end