function BW=impreprocess(x1)

x1=imresize(x1,[256,256]);

%here i have extracted the min and max value of the original image so that i
%can randomly level the original image. from here i put a random 
%level value in imshow to make it visible in human eyes
minA = min(x1(:));
maxA = max(x1(:));
%subplot(4,3,1)
% figure;
% imshow(x1,[-500,2000]);
% title('Original Image')

I2 = imcrop(x1,[50 60 150 135]);
%I3 = imcrop(I2,[1 1 150 150]);
%subplot(4,3,2)
% imshow(I3,[-500,2000]);
% title('Cropped Image')
% subplot(4,3,3)
% imhist(I3);
% title('Histogram of Cropped Image')

%I4 = medfilt2(I2,[3 3]);%'salt & pepper',0.02);
% subplot(4,3,4)
% imshow(I4,[-500,2000]);
% title('Median Filtered Image')

contrast = imadjust(I2);

% figure;
% subplot(1,2,1)
% imshow(contrast);
% title('Enhanced Image')
% figure;
% subplot(1,2,1)
% imhist(contrast);
% title('histogram of enhanced image1')


level = graythresh(contrast);
BW = im2bw(contrast,level);
% subplot(4,3,7)
% imshow(BW)
% title('Converted to Binary Image')
end