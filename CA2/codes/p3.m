clc
close all;
clear;
[fileName,path]=uigetfile({'*.jpeg;*.jpg;*.bmp;*.png;*.tif'}, 'Choose an Image');
picture=imread([path fileName]);
diffImg = imsubtract(picture(:,:,3), rgb2gray(picture));
%Use a median filter to filter out noise
diffImg = medfilt2(diffImg, [3 3]);
diffImg = imbinarize(diffImg,0.28);
diffImg = bwareaopen(diffImg,300);
bw = bwlabel(diffImg, 8);
stats = regionprops(bw, 'BoundingBox', 'Centroid'); 
if ~isempty(stats)
     for object = 1:length(stats)
            blueStrip = stats(object).BoundingBox;
            blueStrip(1)=blueStrip(1)-20;
            blueStrip(2) = blueStrip(2)-250;
            blueStrip(3)=blueStrip(3)*16;
            blueStrip(4)=blueStrip(4)+300;
     end
     I2 = imcrop(picture,blueStrip);
end
picture=I2;
picture=imresize(picture,[300 500]);
picture=rgb2gray(picture);
threshold = graythresh(picture);
picture =~imbinarize(picture,threshold);
picture = bwareaopen(picture,220); 
background=bwareaopen(picture,7000);
picture=picture-background;
[label,numbreOfObjects]=bwlabel(picture);
folderPath='p2\MapSet';
files=dir(folderPath);
mapSet=cell(2,size(files,1)-2);
for i=3:size(files)
    mapSet{1,i-2}=imread(fullfile(folderPath,files(i).name));
    mapSet{2,i-2}=files(i).name(1);
end
resultString=[];
for n=1:numbreOfObjects
            [r,c] = find(label==n);
            Y=picture(min(r):max(r),min(c):max(c));
            Y=imresize(Y,[42,24]);
            corrVals=zeros(1,size(mapSet,2));
            for k=1:size(mapSet,2)   
                corrVals(k)=corr2(mapSet{1,k},Y);
            end
            [MaxCorr,idx]=max(corrVals);
            if MaxCorr>0.7
                resultString=[resultString cell2mat(mapSet(2,idx))];
            end
end
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',resultString);
fclose(file);


