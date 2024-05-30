function grayPic=mygrayfun(picture)
    for i=1:size(picture,1)
        for j=1:size(picture,2)
            grayPic(i,j)=(0.299*picture(i,j,1))+(0.578*picture(i,j,2))+(0.114*picture(i,j,3));
        end
    end
end

