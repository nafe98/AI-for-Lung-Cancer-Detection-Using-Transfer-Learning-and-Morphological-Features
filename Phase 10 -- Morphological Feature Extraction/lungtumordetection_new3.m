clc
clear all
close all

folderPath1 = 'train\Malignant cases';
folderPath2 = 'train\Benign cases';
folderPath3 = 'train\Normal cases';


trainingFeatures_all3=[];trainingFeatures_all=[];trainingFeatures_all1=[];trainingFeatures_all2=[];testFeatures=[];trainingFeatures=[];trainingFeatures1=[];trainingFeatures2=[];
traininglabel1=[];traininglabel=[];traininglabel2=[];traininglabel3=[];trainingFeatures_all32=[];

trainingFeatures12=[];trainingFeatures22=[]; traininglabel12=[];traininglabel32=[];trainingFeatures_all12=[];testFeatures1=[];
test1=[];trainingFeatures122=[];
training1=[];img_benign_idx=[];

for n=1
cd(folderPath1); 
files = dir('**');
files(1:2) = [];

totalFiles = numel(files);



k=0;
for i=1:totalFiles
    Fileaddress{i,1}=strcat(folderPath1,'\',files(i).name);
    file{i} = imread(Fileaddress{i,1});
    CTimage = rgb2gray(file{i});
    BW=impreprocess(CTimage);
    
%morphological operation

se = strel('disk',40);
background = imopen(BW,se);
I6 = BW-background;
a = imcomplement(I6);
% subplot(4,3,8)
% figure;
% imshow(a);
% title('Background is subtracted')

    
%% The lung masks were obtained by filling the holes and 
%%gaps present in the lungs.
BW2 = imfill(a,'holes');
%subplot(4,3,10)
% imshow(BW2)
% title('Lung mask')

%%xor operation between lung mask and clear bordered image
roi = xor(BW2,a);
%roi = imcrop(roi,[1 1 150 220]);
% subplot(4,3,11)
% imshow(roi)
% title('ROI')

%calculated features using regionprops function
%labeledimage =imcomplement(logical(roi));
%props= regionprops(I6, 'Area','Extent','Solidity','Perimeter','Eccentricity');
props1= regionprops(a, 'Area','Extent','Solidity','Perimeter','Eccentricity');

% Area = [props.Area];
% Perimeter = [props.Perimeter];
% Compactness=((Perimeter(:)).^2)./(2*Area(:));
Area1 = [props1.Area];
Perimeter1 = [props1.Perimeter];
Compactness1=((Perimeter1(:)).^2)./(2*Area1(:));
%Circularity=((Perimeter(:).^2))./(4*pi*Area(:));
%trainingFeatures1= [[props.Area]/3.779;[props.Perimeter]/3.779;[props.Eccentricity];Compactness'];
trainingFeatures1= [[props1.Area]/3.779;[props1.Perimeter]/3.779;[props1.Eccentricity];Compactness1'];

if isempty(trainingFeatures1)~= 1
     k=length(trainingFeatures1(1,:));
for j=1:k

traininglabel1=[traininglabel1; 1];
trainingFeatures_all1=[trainingFeatures_all1(:,:),trainingFeatures1(:,j)];
    
end
end
trainingFeatures1=[];
%trainingFeatures12=[];
end

cd(folderPath2); 
files = dir('**');
files(1:2) = [];

totalFiles2 = numel(files);


k=0;
for i=1:totalFiles2
    Fileaddress{i,1}=strcat(folderPath2,'\',files(i).name);
    file{i} = imread(Fileaddress{i,1});
    CTimage = rgb2gray(file{i});
   
    BW=impreprocess(CTimage);
    
%morphological operation

se = strel('disk',40);
background = imopen(BW,se);
I6 = BW-background;
a = imcomplement(I6);
% subplot(4,3,8)
% figure;
% imshow(a);
% title('Background is subtracted')


    
%% The lung masks were obtained by filling the holes and 
%%gaps present in the lungs.
BW2 = imfill(a,'holes');
%subplot(4,3,10)
% imshow(BW2)
% title('Lung mask')

%%xor operation between lung mask and clear bordered image
roi = xor(BW2,a);
%roi = imcrop(roi,[1 1 150 220]);
% subplot(4,3,11)
% imshow(roi)
% title('ROI')

%calculated features using regionprops function
%labeledimage =imcomplement(logical(roi));
%props= regionprops(a, 'Area','Extent','Solidity','Perimeter','Eccentricity');
props1= regionprops(roi, 'Area','Extent','Solidity','Perimeter','Eccentricity');

% Area = [props.Area];
% Perimeter = [props.Perimeter];
% Compactness=((Perimeter(:)).^2)./(2*Area(:));
Area1 = [props1.Area];
Perimeter1 = [props1.Perimeter];
Compactness1=((Perimeter1(:)).^2)./(2*Area1(:));
%Circularity=((Perimeter(:).^2))./(4*pi*Area(:));
%trainingFeatures1= [[props.Area];[props.Extent]; [props.Solidity]; [props.Perimeter]; [props.Eccentricity];Compactness];
%trainingFeatures2= [[props.Area]/3.779;[props.Perimeter]/3.779; [props.Eccentricity];Compactness'];
trainingFeatures2= [[props1.Area]/3.779;[props1.Perimeter]/3.779;[props1.Eccentricity];Compactness1'];

if isempty(trainingFeatures2)~= 1
       k=length(trainingFeatures2(1,:));
for j=1:k

traininglabel2=[traininglabel2; 2];
trainingFeatures_all2=[trainingFeatures_all2(:,:),trainingFeatures2(:,j)];
%end
end
end
trainingFeatures2=[];
end
%end

cd(folderPath3); 
files = dir('**');
files(1:2) = [];
totalFiles3 = numel(files);

k=0;

for i=1:1:totalFiles3
    Fileaddress{i,1}=strcat(folderPath3,'\',files(i).name);
    file{i} = imread(Fileaddress{i,1});
   
    CTimage0 = rgb2gray(file{i});
   
    BW=impreprocess(CTimage0);
    
%morphological operation

se = strel('disk',40);
background = imopen(BW,se);
I6 = BW-background;
a = imcomplement(I6);
% subplot(4,3,8)
% figure;
% imshow(a);
% title('Background is subtracted')


    
%% The lung masks were obtained by filling the holes and 
%%gaps present in the lungs.
BW2 = imfill(a,'holes');
%subplot(4,3,10)
% imshow(BW2)
% title('Lung mask')

%%xor operation between lung mask and clear bordered image
roi = xor(BW2,a);
%roi = imcrop(roi,[1 1 150 220]);
% subplot(4,3,11)
% imshow(roi)
% title('ROI')


%calculated features using regionprops function
%labeledimage5 = (logical(roi));
%figure;
%imshow(labeledimage);
%props= regionprops(BWnobord, 'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');
props= regionprops(a, 'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');

Area = [props.Area];
Perimeter = [props.Perimeter];
Compactness=((Perimeter(:)).^2)./(2*Area(:));
%Circularity=((Perimeter(:).^2))./(4*pi*Area(:));
%trainingFeatures= [[props.Area];[props.Extent]; [props.Solidity]; [props.Perimeter]; [props.Eccentricity];Compactness];
trainingFeatures= [[props.Area]/3.779;[props.Perimeter]/3.779;[props.Eccentricity];Compactness'];

if isempty(trainingFeatures)~= 1
         k=length(trainingFeatures(1,:));
for j=1:k

traininglabel=[traininglabel; 3];
trainingFeatures_all=[trainingFeatures_all(:,:),trainingFeatures(:,j)];
    %end
end
end


trainingFeatures=[];
end

trainingFeatures_all3=[trainingFeatures_all1'; trainingFeatures_all'];
traininglabel3=[traininglabel1; traininglabel];

trainingFeatures_all5=[trainingFeatures_all1'; trainingFeatures_all2'];
traininglabel5=[traininglabel1; traininglabel2];

trainingFeatures_all4=[trainingFeatures_all2'; trainingFeatures_all'];
traininglabel4=[traininglabel2; traininglabel];

tic 
svm1= svmtrain(trainingFeatures_all3, traininglabel3(:,:)'); 

svm2= svmtrain(trainingFeatures_all4, traininglabel4(:,:)'); 

svm3= svmtrain(trainingFeatures_all5, traininglabel5(:,:)'); 
toc
   

folderPath4='E:\Lung cancer detection\Data\test\Malignant cases';
cd(folderPath4); 
files = dir('**');
files(1:2) = [];

totaltestFiles = numel(files);
testFeatures_all1=[];testFeatures_all2=[];testFeatures_all=[];
malig_error=0;accuracy_malig=0;accuracy_normal=0;predictedStat2=[];predictedStat4=[];
props1=0;props2=0;k=0;

for i=1:totaltestFiles%(round(totalFiles*(20/100)))
Fileaddress{i,1}=strcat(folderPath4,'\',files(i).name);
testfile1{i} = imread(Fileaddress{i,1});
CTimage1= rgb2gray(testfile1{i});
BW3=impreprocess(CTimage1);

    
%morphological operation

se = strel('disk',40);
background1 = imopen(BW3,se);
I7 = BW3-background1;
a1 = imcomplement(I7);
% subplot(4,3,8)
% figure;
% imshow(a);
% title('Background is subtracted')


    
%% The lung masks were obtained by filling the holes and 
%%gaps present in the lungs.
BW2_2= imfill(a1,'holes');
% figure;
% imshow(a1)
% title('Lung mask of test image')

%%xor operation between lung mask and clear bordered image
roi1 = xor(BW2_2,a1);
%roi1=imcrop(roi1,[1 1 150 220]);
% figure;
% imshow(roi1)
% title('ROI of test image')


%calculated features using regionprops function
%labeledimage2 = imcomplement(logical(roi1));
%props1= regionprops(I7, 'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');
props2= regionprops(a1, 'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');

%testFeatures= [[props1.Area];[props1.Extent];[props1.Solidity];[props1.Perimeter]; [props1.Eccentricity]];
% Area = [props1.Area];
% Perimeter = [props1.Perimeter];
% Compactness=((Perimeter(:)).^2)./(2*Area(:));
Area1 = [props2.Area];
Perimeter1 = [props2.Perimeter];
Compactness1=((Perimeter1(:)).^2)./(2*Area1(:));

%Circularity=((Perimeter(:).^2))./(4*pi*Area(:));
%testFeatures= [[props1.Area];[props1.Extent]; [props1.Solidity]; [props1.Perimeter]; [props1.Eccentricity];Compactness];
%testFeatures= [[props1.Area]/3.779;[props1.Perimeter]/3.779;[props1.Eccentricity];Compactness'];
testFeatures1= [[props2.Area]/3.779;[props2.Perimeter]/3.779;[props2.Eccentricity];Compactness1'];


if isempty(testFeatures1)~=1 %&& isempty(testFeatures1)~=1
k=length(testFeatures1(1,:));
for j=1:k
testFeatures_all1=[testFeatures_all1(:,:),testFeatures1(:,j)];
predictedStat2(i,j)= svmclassify(svm1(:,:), testFeatures1(:,j)');
predictedStat4(i,j)= svmclassify(svm3(:,:), testFeatures1(:,j)');
end

if length(find(predictedStat4(i,:)==1))~=0
accuracy_malig=accuracy_malig+1;
else malig_error=malig_error+1;
end
end  
%end
testFeatures=[];
testFeatures1=[];
end

folderPath5='E:\Lung cancer detection\Data\test\Benign cases';
cd(folderPath5); 
files = dir('**');
files(1:2) = [];

totaltestFiles1 = numel(files);
benign_error=0;accuracy_benign=0;k=0;predictedStat3=[];predictedStat5=[];
props1=0;props2=0;k=0;

for i=1:totaltestFiles1%(round(totalFiles*(20/100)))
Fileaddress{i,1}=strcat(folderPath5,'\',files(i).name);
testfile1{i} = imread(Fileaddress{i,1});
CTimage1= rgb2gray(testfile1{i});
BW3=impreprocess(CTimage1);

    
%morphological operation

se = strel('disk',40);
background1 = imopen(BW3,se);
I7 = BW3-background1;
a1 = imcomplement(I7);
% subplot(4,3,8)
% figure;
% imshow(a);
% title('Background is subtracted')

    
%% The lung masks were obtained by filling the holes and 
%%gaps present in the lungs.
BW2_2= imfill(a1,'holes');
% figure;
% imshow(a1)
% title('Lung mask of test image')

%%xor operation between lung mask and clear bordered image
roi1 = xor(BW2_2,a1);
%roi1=imcrop(roi1,[1 1 150 220]);
% figure;
% imshow(roi1)
% title('ROI of test image')


%calculated features using regionprops function
%labeledimage2 = imcomplement(logical(roi1));
%props1= regionprops(a1, 'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');
props2= regionprops(roi1, 'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');

%testFeatures= [[props1.Area];[props1.Extent];[props1.Solidity];[props1.Perimeter]; [props1.Eccentricity]];
% Area = [props1.Area];
% Perimeter = [props1.Perimeter];
% Compactness=((Perimeter(:)).^2)./(2*Area(:));
Area1 = [props2.Area];
Perimeter1 = [props2.Perimeter];
Compactness1=((Perimeter1(:)).^2)./(2*Area1(:));
%Circularity=((Perimeter(:).^2))./(4*pi*Area(:));
%testFeatures= [[props1.Area];[props1.Extent]; [props1.Solidity]; [props1.Perimeter]; [props1.Eccentricity];Compactness];
%testFeatures= [[props1.Area]/3.779;[props1.Perimeter]/3.779;[props1.Eccentricity];Compactness'];
testFeatures2= [[props2.Area];[props2.Perimeter];[props2.Eccentricity];Compactness1'];


if isempty(testFeatures2)~=1
k=length(testFeatures2(1,:));
for j=1:k
testFeatures_all2=[testFeatures_all2(:,:),testFeatures2(:,j)];
predictedStat3(i,j)= svmclassify(svm2(:,:), testFeatures2(:,j)');
predictedStat5(i,j)= svmclassify(svm3(:,:), testFeatures2(:,j)');
end 
if length(find(predictedStat3(i,:)==2))~=0 && length(find(predictedStat5(i,:)==2))~=0
accuracy_benign=accuracy_benign+1;
else benign_error=benign_error+1;
end 
end
%end
testFeatures=[];
testFeatures2=[];
end

folderPath6='E:\Lung cancer detection\Data\test\Normal cases';
cd(folderPath6); 
files = dir('**');
files(1:2) = [];

totaltestFiles2 = numel(files);
normal_error=0;k=0;accuracy_normal=0;predictedStat1=[];normal_error1=0;k=0;accuracy_normal1=0;
props1=0;props2=0;k=0;

for i=1:totaltestFiles2%(round(totalFiles*(20/100)))
Fileaddress{i,1}=strcat(folderPath6,'\',files(i).name);
testfile2{i} = imread(Fileaddress{i,1});
CTimage2= rgb2gray(testfile2{i});
BW3=impreprocess(CTimage2);

    
%morphological operation

se = strel('disk',40);
background1 = imopen(BW3,se);
I7 = BW3-background1;
a1 = imcomplement(I7);
% subplot(4,3,8)
% figure;
% imshow(a);
% title('Background is subtracted')



    
%% The lung masks were obtained by filling the holes and 
%%gaps present in the lungs.
BW2_2= imfill(a1,'holes');
% figure;
% imshow(a1)
% title('Lung mask of test image')

%%xor operation between lung mask and clear bordered image
roi_normal = xor(BW2_2,a1);
%roi1=imcrop(roi1,[1 1 150 220]);
% figure;
% imshow(roi1)
% title('ROI of test image')


%calculated features using regionprops function
%labeledimage2 = imcomplement(logical(roi_normal));
props2= regionprops(a1,'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');
%props2= regionprops(a1,'Area','Centroid','Extent','Solidity','Perimeter','Eccentricity');

Area = [props2.Area];
Perimeter = [props2.Perimeter];
Compactness=((Perimeter(:)).^2)./(2*Area(:));
%Circularity=((Perimeter(:).^2))./(4*pi*Area(:));
%trainingFeatures1= [[props.Area];[props.Extent]; [props.Solidity]; [props.Perimeter]; [props.Eccentricity];Compactness;Circularity];
%if trainingFeatures>0
%testFeatures= [[props2.Area]; [props2.Extent];[props2.Solidity];[props2.Perimeter]; [props2.Eccentricity];Compactness];
testFeatures= [[props2.Area]/3.779;[props2.Perimeter]/3.779; [props2.Eccentricity];Compactness'];


if isempty(testFeatures)~=1
    k=length(testFeatures(1,:));
for j=1:k
testFeatures_all=[testFeatures_all(:,:),testFeatures(:,j)];
predictedStat1(i,j)= svmclassify(svm1(:,:), testFeatures(:,j)');
predictedStat(i,j)= svmclassify(svm2(:,:), testFeatures(:,j)');

end
if length(find(predictedStat1(i,:)==3))~=0 || length(find(predictedStat(i,:)==3))~=0
 accuracy_normal= accuracy_normal+1;
else normal_error=normal_error+1;
end
end
 
testFeatures=[];
end


Accuracy_M(n)=(accuracy_malig*100)/113  % 100% using I6, 21.4% using roi, 
Accuracy_B(n)=(accuracy_benign*100)/24   % 100% using a, 96.66% using roi
Accuracy_N(n)=(accuracy_normal*100)/84
end
trainingFeatures_together=[trainingFeatures_all1';trainingFeatures_all2';trainingFeatures_all'];
traininglabel_together=[traininglabel1;traininglabel2;traininglabel];
trainingFeatures_label_all=[trainingFeatures_together,traininglabel_together];
testFeatures_together=[testFeatures_all1';testFeatures_all2';testFeatures_all'];