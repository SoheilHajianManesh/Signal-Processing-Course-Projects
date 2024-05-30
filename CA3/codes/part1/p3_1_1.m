mapSet=cell(2,32);
mapSet = {'a' , 'b' , 'c' , 'd' , 'e' , 'f' , 'g' , 'h' , 'i' , 'j' , 'k' , 'l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','.',',','!',';','$' };
for i=1:32
    mapSet{2,i}=dec2bin(i-1,5);
end
rgbPic=imread("image1.jpg");
grayPic=rgb2gray(rgbPic);

% p3_1_3 
codedPicture=coding("signal",grayPic,mapSet);
figure;
subplot(1, 2, 1);
imshow(grayPic);
title('Original Image');

subplot(1, 2, 2);
imshow(codedPicture);
title('Coded Image');


% p3_1_4

decodeMsg=decoding(codedPicture,mapSet);
disp(decodeMsg);
