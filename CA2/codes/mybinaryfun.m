function binaryPic=mybinaryfun(picture,treshold)
    for i=1:size(picture,1)
        for j=1:size(picture,2)
            if picture(i,j)>treshold
                binaryPic(i,j)=1;
            else
                binaryPic(i,j)=0;
            end
        end
    end
end




