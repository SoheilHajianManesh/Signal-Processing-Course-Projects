clc
close all;
clear;
[fileName,path]=uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
picture=imread([path fileName]);
picture=imresize(picture,[300 500]);
picture=mygrayfun(picture);
threshold=graythresh(picture)*255;
picture=~mybinaryfun(picture,threshold-4);
cleanPic=myremovecom(picture,200);
backGround=myremovecom(picture,7000);
picture=logical(cleanPic-backGround);
[label,numberOfObjects]=mysegmentation(picture);
% dist(numberOfObjects);
figure;
imshow(picture);
folderPath='p1\MapSet';
files=dir(folderPath);
mapSet=cell(2,size(files,1)-2);
for i=3:size(files)
    mapSet{1,i-2}=imread(fullfile(folderPath,files(i).name));
    mapSet{2,i-2}=files(i).name(1);
end
resultString=[];
minCorrVal=0.4;
for i=1:numberOfObjects
    [row,col]=find(label==i);
    currentObject=picture(min(row):max(row),min(col):max(col));
    currentObject=imresize(currentObject,[42 24]);
    corrVals=zeros(1,size(mapSet,2));
    for j=1:size(mapSet,2)
        corrVals(j)=corr2(currentObject,mapSet{1,j});
    end
    [maxCorrVal,idx]=max(corrVals);
    if(maxCorrVal>minCorrVal)
        resultString=[resultString mapSet{2,idx}];
    end
end
fprintf('%s',resultString);
file = fopen('PlateNumber.txt', 'wt');
fprintf(file,'%s\n',resultString);
fclose(file);