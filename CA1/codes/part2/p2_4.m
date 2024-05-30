function [a, B]=p2_4(x,y)
    coefMat=zeros(2,2);
    constMat=zeros(2,1);
    for i=1:size(x, 2)
        coefMat(1,1)=coefMat(1,1)+x(i)^2;
        coefMat(1,2)=coefMat(1,2)+x(i);
        coefMat(2,1)=coefMat(2,1)+x(i);
        coefMat(2,2)=coefMat(2,2)+1;
        constMat(1,1)=constMat(1,1)+x(i)*y(i);
        constMat(2,1)=constMat(2,1)+y(i);
    end
    determinant=coefMat(1,1)*coefMat(2,2)-coefMat(1,2)*coefMat(2,1);
    invMat=(1/determinant)*[coefMat(2,2) -1*coefMat(1,2);
                            -1*coefMat(2,1) coefMat(1,1)];
    finalMat=invMat*constMat;
    a=finalMat(1,1);
    B=finalMat(2,1);
end